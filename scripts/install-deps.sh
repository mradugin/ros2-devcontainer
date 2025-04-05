#!/bin/bash

# Source logging functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/logging.sh"

info "Installing apt packages..."
# Uncomment and modify below line to install apt packages
# sudo apt install -y --no-install-recommends PACKAGE1 PACKAGE2 || fatal "Failed to install apt packages"

info "Installing python packages..."
# Uncomment and modify below line to install python packages
# python3 -m pip install PACKAGE1 PACKAGE2 || fatal "Failed to install python packages"

info "Installing rosdep dependencies..."
rosdep install --from-paths src --ignore-src -y || fatal "Failed to install rosdep dependencies"

info "Dependencies installed successfully"
