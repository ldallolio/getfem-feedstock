#!/usr/bin/env bash
set -ex

echo "**************** G E T F E M  B U I L D  S T A R T S  H E R E ****************"

#./autogen.sh
# --enable-octave
./configure --prefix=$PREFIX --enable-shared --with-pic --enable-python [[ "$target_platform" == "win-64" ]]  && patch_libtool make -j${CPU_COUNT} make install
#make -j $CPU_COUNT
#make install
#make check -j $CPU_COUNT

echo "**************** G E T F E M  B U I L D  E N D S  H E R E ****************"
