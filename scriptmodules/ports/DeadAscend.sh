#! /bin/bash

# This file is part of The Fossil Pie Project
#
# See the LICENSE file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/LightBytes/fossil-pie/master/LICENSE
#

rp_module_id="deadascend"
rp_module_desc="A hand-drawn, open source, point'n'click-like 2D adventure game 
written in Qt/QML and Javascript.

A horde of Zombies chased you to the old radio tower. Your only chance is to 
ascend up through the tower - solving a host of puzzles on your way to your rescue."
rp_module_license="MIT"
rp_module_section="exp"

function depends_deadascend() {
    sudo apt-get install git q
}

function install_deadascend() {
    git clone --depth=1 https://github.com/Larpon/DeadAscend.git
    cd DeadAscend/extensions/
    git clone --depth=1 https://github.com/Larpon/qak.git
    git clone --depth=1 https://github.com/Larpon/QtFirebase.git
    cd ../
    qmake -r "BIN_DIR=/usr/bin" "ASSETS_DIR=/usr/share/deadascend" && \
        make assetsrcc -C App && make && \
        sudo make install && cd ../ && rm -rf DeadAscend
}

