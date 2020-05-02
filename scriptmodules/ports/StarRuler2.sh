#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="starruler2"
rp_module_desc="Star Ruler 2 is a massive scale 4X/RTS set in space. 

Explore dozens, hundreds, or even thousands of systems in a galaxy of your 
choosing, expand across its planets, exploit the resources you find, and 
ultimately exterminate any who stand in your way. The fate of your empire 
depends on your ability to master the economy, field a military, influence
galactic politics, and learn what you can about the universe."
rp_module_license="Source: MIT. Art Assets: CC-BY-NC 2.0"
rp_module_section="exp"


function depends_starruler2() {
    sudo apt-get install -y git make
}

function install_starruler2() {
    git clone --depth=1 https://github.com/BlindMindStudios/StarRuler2-Source StarRuler2
    cd StarRuler2 && make -f source/linux/Makefile compile
}

function configure_starruler2() {
    
}