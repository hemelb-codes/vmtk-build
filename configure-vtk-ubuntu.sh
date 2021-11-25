#!/bin/bash

thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/cmake_help.sh
 
declare -A D
D[CMAKE_INSTALL_PREFIX]=$INSTALL_PREFIX
D[CMAKE_BUILD_TYPE]=Release
D[BUILD_SHARED_LIBS]=ON
D[VTK_WRAP_PYTHON]=ON
D[VTK_PYTHON_VERSION]=3
D[VTK_Group_Rendering]=ON
D[BUILD_TESTING]=OFF
D[CMAKE_BUILD_WITH_INSTALL_RPATH]=OFF

mkdir -p build
cd build
run_cmake D ../vtk
