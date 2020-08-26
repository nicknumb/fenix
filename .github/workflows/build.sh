#!/bin/bash

CONFIG=.github/workflows/configs/config-github-actions.conf

touch .ignore-update

# Malinline u-boot & Mainline linux

# Legacy u-boot & Legacy linux

sed -i 's/KHADAS_BOARD=.*/KHADAS_BOARD=VIM1/g' $CONFIG
sed -i 's/DISTRIB_TYPE=.*/DISTRIB_TYPE=server/g' $CONFIG
source env/setenv.sh config $CONFIG
sudo rm -rf build/images/.tmp/*
BUILD_TYPE=release COMPRESS_IMAGE=yes NO_CCACHE=yes make
sudo rm -rf build/images/*.img

exit
