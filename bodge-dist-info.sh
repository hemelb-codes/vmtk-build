#!/bin/bash

# Just make some basic stuff show up for setuptools

distinfo=$SITE_PACKAGES_DIR/$NAME-$VERSION.dist-info
mkdir -p $distinfo
cat > $distinfo/METADATA <<EOF
Metadata-Version: 2.1
Name: $NAME
Version: $VERSION
EOF
