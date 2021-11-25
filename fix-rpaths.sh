#!/bin/bash
set -e
set -x
set -u

if [ ! -d $PREFIX ]; then
    echo "No directory $PREFIX"
    exit 1
fi

cd $PREFIX

# Do bin first
for exe in bin/*; do
    if file $exe | grep "${exe}: ELF" > /dev/null; then
	patchelf --set-rpath '$ORIGIN/../lib' $exe
    fi
done

# Now lib
for lib in lib/lib*; do
    if file $lib | grep "${lib}: ELF" > /dev/null; then
	patchelf --set-rpath '$ORIGIN' $lib
    fi
done

# Now python extensions
find lib/python${PY_VER}/site-packages -name '*.so' | xargs patchelf --set-rpath '$ORIGIN/../../..'
