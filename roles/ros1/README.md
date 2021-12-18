# miso-robotics.ros.ros1

Install ROS 1.

## Requirements

None.

## Role Variables

**ros_distro**: Distribution of ROS 1 to install.

- `melodic`
- `noetic`

**gazebo_version**: Version of gazebo to install or null.

- `"11"`
- `"9"`

**dev**: If yes, install ROS development packages.

- `yes`
- `no`

**packages**: List of ROS packages to install (without ros-{ros_distro}- prefix).

**rosdep_update**: If true, initialize rosdep and update sources

- `yes`
- `no`

## Dependencies

None.

## Example Playbook

Install latest LTS version of ROS 1 with latest Gazebo including development **packages**: `yaml

```yaml
- hosts: servers
  roles: [misorobotics.ros.ros1]
```

## License

MIT
