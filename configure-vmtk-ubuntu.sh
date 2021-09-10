#!/bin/bash

cmake \
    -B build \
    -S vmtk \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=$INSTALL_PREFIX \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DVMTK_BUILD_TESTING:BOOL=OFF \
    -DBUILD_DOCUMENTATION:BOOL=OFF \
    -DVTK_VMTK_WRAP_PYTHON:BOOL=ON \
    -DVMTK_USE_SUPERBUILD:BOOL=OFF \
    -DVMTK_MINIMAL_INSTALL:BOOL=OFF \
    -DVMTK_WITH_LIBRARY_VERSION:BOOL=OFF \
    -DVTK_VMTK_BUILD_TETGEN:BOOL=OFF \
    -DVTK_VMTK_BUILD_STREAMTRACER:BOOL=OFF \
    -DVMTK_USE_RENDERING:STRING=ON \
    -DITK_DIR:PATH=$ITK_DIR \
    -DVTK_DIR:PATH=$VTK_DIR \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF
