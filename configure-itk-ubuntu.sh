#!/bin/bash
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/cmake_help.sh
 
declare -A D

D[CMAKE_INSTALL_PREFIX]=$INSTALL_PREFIX
D[CMAKE_BUILD_TYPE]=Release
D[BUILD_SHARED_LIBS]=ON
D[BUILD_EXAMPLES]=OFF
D[BUILD_TESTING]=OFF
D[CMAKE_BUILD_WITH_INSTALL_RPATH]=OFF
D[CMAKE_INSTALL_RPATH_USE_LINK_PATH]=TRUE

# From Superbuild ITK 5
D[ITK_LEGACY_REMOVE]=OFF   #<-- Allow LEGACY ITKv4 features for now.
D[ITK_LEGACY_SILENT]=ON   #<-- Use of legacy code will produce compiler warnings
D[Module_ITKDeprecated]=ON #<-- Needed for ITKv5 now. (itkMultiThreader.h and MutexLock backwards compatibility.)
D[Module_ITKReview]=OFF

mkdir -p build
cd build

run_cmake D ../itk
