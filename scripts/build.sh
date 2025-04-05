#!/bin/bash

# Source logging functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/logging.sh"

info "Building the project..."
colcon --log-level info build \
    --mixin debug ccache compile-commands gold \
    --symlink-install \
    --event-handlers "console_direct+" \
    --cmake-args -DMY_CPP_NODE_FLAG=ON || fatal "Failed to build the project"

info "Build completed successfully"
