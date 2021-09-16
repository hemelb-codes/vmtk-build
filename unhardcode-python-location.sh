#!/bin/bash

# Set BUILD_DIR and CMAKE_CONFIG_DIR
function unhardcode {
    local varname=$1
    local value=$(cmake -N -LA $BUILD_DIR | fgrep $varname | cut -d '=' -f2)
    fgrep -l "${value}" --include='*.cmake' -r $CMAKE_CONFIG_DIR | xargs sed -i.orig "s|${value}|\${$varname}|"
}

set -x

unhardcode PYTHON_INCLUDE_DIR
unhardcode PYTHON_LIBRARY
