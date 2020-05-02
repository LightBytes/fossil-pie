#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="GardenOfColoredLights"
rp_module_desc='An old school 2D vertical shoot-em-up with some innovative elements.'
rp_module_license="GPLv3.0"
rp_module_section="exp"

function depends_GardenOfColoredLights() {
    sudo apt-get install -y liballegro-dev
}

function install_GardenOfColoredLights() {
    wget 'https://downloads.sourceforge.net/project/garden/garden/1.0.9/garden-1.0.9.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fgarden%2Ffiles%2Fgarden%2F1.0.9%2Fgarden-1.0.9.tar.gz%2Fdownload&ts=1588433321' -O garden-1.0.9.tar.gz
    tar -xvzf garden-1.0.9.tar.gz && rm garden-1.0.9.tar.gz
    cd  garden-1.0.9/
    ./configure
    sed -i 's/inline int xpart/int xpart/g' src/stuff.c
    sed -i 's/inline int ypart/int ypart/g' src/stuff.c
    make -j4
    sudo make install
}

function configure_GardenOfColoredLights() {

}