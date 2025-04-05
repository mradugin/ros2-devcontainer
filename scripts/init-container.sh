#!/bin/bash

# Source logging functions
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/logging.sh"

$SCRIPT_DIR/update-repos.sh
$SCRIPT_DIR/install-deps.sh

WORKSPACE_PATH=${PWD}
WORKSPACE_SETUP_SCRIPT=${WORKSPACE_PATH}/install/setup.bash
info "Setting up .bashrc to source ${WORKSPACE_SETUP_SCRIPT}..."
grep -qF 'WORKSPACE_SETUP_SCRIPT' $HOME/.bashrc || echo "source ${WORKSPACE_SETUP_SCRIPT} # WORKSPACE_SETUP_SCRIPT" >> $HOME/.bashrc

# Allow initial setup to complete successfully even if build fails
$SCRIPT_DIR/build.sh || true
