#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="FrikingShark"
rp_module_desc='Port of Friking Shark (remake of Flying Shark) on the OpenPandora, Odroid and most Linux.'
rp_module_license="GPLv3.0 + other"
rp_module_section="exp"

function depends_FrikingShark() {
    sudo apt-get install -y \
        libgl1-mesa-dev libglu1-mesa-dev libxrandr-dev
        libopenal-dev libalut-dev libogg-dev libvorbis-dev
}

function install_FrikingShark() {
    git clone --depth=1 https://github.com/ptitSeb/friking-shark
    cd friking-shark
    cmake .
    make -j4
}

function configure_FrikingShark() {
    
}