#!/bin/bash

symlink-collection() {
	local -r collections="${HOME}/.ansible/collections/ansible_collections"
	mkdir -pv "${collections}"

	local -r namespace="$(yq e '.namespace' galaxy.yml)"
	local -r name="$(yq e '.name' galaxy.yml)"
	local -r namespace_path="${collections}/${namespace}"

	local -r target="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd)"
	local -r link_name="${namespace_path}/${name}"
	mkdir -pv "${namespace_path}"
	ln -s "${target}" "${link_name}"
}

main() {
	git submodule update --init --recursive
	symlink-collection
}

main
