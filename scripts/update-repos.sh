#!/bin/bash

# Source logging functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/logging.sh"

info "Updating apt package list..."
sudo apt update

info "Updating the local rosdep database..."
rosdep --rosdistro=${ROS_DISTRO} update

info "Adding colcon mixin repository..."
colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml
colcon mixin update default 
