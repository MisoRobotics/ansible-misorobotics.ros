# syntax=docker/dockerfile:1.3
ARG VARIANT=focal
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

SHELL ["/bin/bash", "-c"]
COPY .devcontainer/apt.conf.d/* /etc/apt/apt.conf.d/

# [Option] Install zsh
ARG INSTALL_ZSH="false"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="true"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your
# own dependencies. A user of "automatic" attempts to reuse an user ID if one already exists.
ARG USERNAME=automatic
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY .devcontainer/library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update && sudo apt-get install -y python3-{dev,pip,setuptools,wheel} python-is-python3 \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "true" "true" \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# Install development tools.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y bash-completion ca-certificates curl git git-lfs software-properties-common tig vim
RUN cd /etc/bash_completion.d \
    && curl -fsSLO https://raw.githubusercontent.com/rsinnet/git-bash-aliases/master/git-bash-aliases.bash
RUN pip3 install --no-cache-dir bandit black flake8{,-black,-docstrings,-isort} isort mypy pycodestyle pydocstyle pylint

# Install the latest version of ansible.
RUN export DEBIAN_FRONTEND=noninteractive \
    && add-apt-repository -y -u ppa:ansible/ansible \
    && apt-get install -y ansible{,-doc,-lint}

# Install yq for parsing YAML.
RUN cd /usr/local/bin \
    && export system="$(uname -s)" deb_arch="$(dpkg --print-architecture)" \
    && curl -fsSLo yq "https://github.com/mikefarah/yq/releases/latest/download/yq_${system,,}_${deb_arch}" \
    && chmod +x yq

COPY --chown=vscode:vscode .devcontainer/dotfiles/.* /home/vscode/
# RUN rm -f /etc/ansible/hosts /etc/ansible/ansible.cfg
