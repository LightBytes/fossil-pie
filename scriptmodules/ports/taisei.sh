#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="taisei"
rp_module_desc="A free and open-source Touhou Project clone and fangame."
rp_module_license="GPLv3 + Various FOSS compatible."
rp_module_section="exp"

function depends_taisei() {
    sudo apt-get install -y python3-dev python3-pip \
        libgles2 libgles2-mesa-dev \
        libsdl2-dev libsdl2-mixer-dev libfreetype6-dev \
        libpng-dev libwebp-dev \
        libzip-dev libopusfile-dev zlib1g-dev
}

# NOTE: ~500MB disk space required
function install_taisei() {
    pushd $(pwd)
    git clone https://github.com/taisei-project/taisei
    cd taisei/
    git submodule init
    git submodule update
    mkdir -p build
    cd build/
    sudo python3 -m pip install --upgrade meson

    # build, install and clean-up
    (`which meson` --prefix=/usr/local/ .. && \
        ninja && \
        sudo ninja install && \
        popd && rm -rf taisei/ || popd)
}

function configure_taisei() {

}