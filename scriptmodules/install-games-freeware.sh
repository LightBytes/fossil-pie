#! /bin/bash

export BUILD_ROOT=${BUILD_ROOT:-/tmp/}
export ROMS_DIR=${ROMS_DIR:=~/RetroPie/roms}
export GAMES_DIR=${ROMS_DIR}/ports/

# Paybacktime 2 is a multiplayer X-COM-esque turn based tactics game for MS-DOS.
# Originally developed during 1994-1997 by Niko Nevatie and Kari Luojus - later released as public domain with source code.
function install_paybacktime2
  pushd $(pwd)
  cd $BUILD_ROOT 
  git clone https://github.com/nnevatie/paybacktime2
  mv paybacktime2 $ROMS_DIR/dosbox/
  popd
}

function install_glypha() {
  QT_MULTIMEDIA_VERSION='5.11.3-2_armhf'
  QT_MULTIMEDIA_DEV_PKG='qtmultimedia5-dev_${QT_MULTIMEDIA_VERSION}.deb'
  sudo apt-get install -y libqt5multimedia libqt5multimediagsttools5 libqt5multimediaquick5 libqt5multimediawidgets5
  sudo apt-get install -y libqt5opengl5-dev libqt5multimedia libgl1-mesa-dev
  sudo apt-get install -y libsdl2-gfx-dev libsdl-gfx1.2-dev
  sudo apt-get install -y libqt5multimedia-dev || \
    (wget http://ftp.de.debian.org/debian/pool/main/q/qtmultimedia-opensource-src/${QT_MULTIMEDIA_DEV_PKG} && \
     sudo dpkg -i ${QT_MULTIMEDIA_DEV_PKG} && rm ${QT_MULTIMEDIA_DEV_PKG})
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://github.com/kainjow/Glypha
  cd Glypha && \
    sed -i 's|namespace GL|#include <GL/glu.h>\n#include <GL/glut.h>\nnamespace GL|' game/GLRect.h && \
    make qt && mkdir -p $GAMES_DIR/GlyphaIII && \
    cp build/Glyphia* $GAMES_DIR/GlyphaIII && \
    cp build/resources $GAMES_DIR/GlyphaIII && \
    echo "$GAMES_DIR/GlyphaIII/Glyphia\ III" > "$GAMES_DIR/Glyphia III.sh" && \
    chmod +x "$GAMES_DIR/Glyphia III.sh"
  cd - && rm -rf Glyphia
  popd
}

function install_ironseed() {
  sudo apt-get install -y libsdl2-gfx-dev libsdl-gfx1.2-dev fpc
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://github.com/y-salnikov/ironseed_fpc ironseed
  cd ironseed/ && \
    make && \ 
    cd - && \
    mv $BUILD_ROOT/ironseed_fpc $GAMES_DIR/ironseed && \
    echo "$GAMES_DIR/ironseed/ironseed" > "$GAMES_DIR/Iron Seed.sh" && \
    chmod +x "$GAMES_DIR/Iron Seed.sh"
  popd
}

function install_colobot() {
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://github.com/colobot/colobot
  cd colobot && make

  popd
}

function install_planetbluepi() {
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone --recursive https://github.com/blupi-games/planetblupi-dev.git
  cd planetblupi-dev && mkdir Release && cd Release && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j4 && cd $BUILD_ROOT && \
  popd
}