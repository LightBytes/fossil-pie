#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="openhexagon"
rp_module_desc='C++14 FOSS clone of "Super Hexagon". Depends on SSVStart, SSVEntitySystem, SSVLuaWrapper, SSVMenuSystem, JSONcpp, SFML2.0. Features JSON/LUA customizable game files, a soundtrack by BOSSFIGHT, pseudo-3D effects.'
rp_module_license="Academic Free License v3.0"
rp_module_section="exp"

function depends_openhexagon() {
    sudo apt-get install -y g++ liblua5.2-dev zlib1g-dev
}

function install_openhexagon() {
    git clone git://github.com/SuperV1234/SSVOpenHexagon.git
    cd SSVOpenHexagon
    ./init-repository.sh
    ./build-repository-oh.sh
    ./wget-assets.sh ./_RELEASE/
}