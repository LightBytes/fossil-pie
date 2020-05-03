#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="thedarkmod"
rp_module_desc="A detailed tribute to the thief series."
rp_module_license="GPLv3 + Various FOSS compatible."
rp_module_section="exp"

function depends_thedarkmod() {
    sudo apt-get install -y p7zip make g++ git \
        build-essential manpages-dev scons \
        libx11-dev libxxf86vm-dev libxext-dev \
        gettext automake libtool pkg-config zlib1g-dev \
        libjpeg62-dev libwxgtk3.0-dev libxml2-dev \
        libsigc++-2.0-dev libpng-dev libftgl-dev libglew-dev \
        python-dev libalut-dev libvorbis-dev pybind11-dev
}

function install_darkradiant() {
    ./autogen.sh
    ./configure --enable-darkmod-plugins
    make
    make install
}

# FIXME: needs testing
function install_thedarkmod() {
    wget https://www.thedarkmod.com/sources/thedarkmod.2.07.src.7z
    7zr x -othedarkmod thedarkmod.2.07.src.7z
    cd thedarkmod/
    scons BUILD="release" TARGET_ARCH="armhf" -j4
}

function configure_thedarkmod() {

}