# miso-robotics.ros.ros2

Install ROS 21.

## Requirements

None.

## Role Variables

**ros_distro**: Distribution of ROS 2 to install.

- `foxy`
- `galactic`

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

Install latest LTS version of ROS 2 with latest Gazebo including development **packages**: `yaml

```yaml
- hosts: servers
  roles: [misorobotics.ros.ros2]
```

## License

MIT
