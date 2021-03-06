#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="OpenClonk"
rp_module_desc="A free multiplayer action game where you control small and nimble humanoids."
rp_module_license="ISC"
rp_module_section="exp"

function depends_OpenClonk() {
    sudo apt-get install -y cmake git \
        libsdl2-dev libgles2-mesa-dev \
        libopenal-dev libminiupnpc-dev libxrandr-dev \
        libtinyxml2-dev libglew-dev
}

# NOTE: requires ~500MB disk space
function install_OpenClonk() {
    git clone https://github.com/openclonk/openclonk
    cd openclonk/
    cmake . && make -j4 && sudo make install && \
        cd - && rm -rf openclonk/
}

function configure_OpenClonk() {

}