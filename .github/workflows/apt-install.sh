#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y \
     libgl1-mesa-glx \
     libgl1-mesa-dev \
     libglapi-mesa \
     libosmesa6-dev \
     libxt-dev
