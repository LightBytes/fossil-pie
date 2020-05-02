#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="thedarkmod"
rp_module_desc=""
rp_module_license=""
rp_module_section="exp"

function depends_thedarkmod() {
    sudo apt-get install -y p7zip make g++ git
}

function install_thedarkmod() {
    wget https://www.thedarkmod.com/sources/thedarkmod.2.07.src.7z
    7zr x -othedarkmod thedarkmod.2.07.src.7z
}

function configure_thedarkmod() {

}