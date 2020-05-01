#! /bin/bash
#########################
### open source games ###
#########################

export BUILD_ROOT=${BUILD_ROOT:-/tmp/}
export ROMS_DIR=${ROMS_DIR:=~/RetroPie/ports}
export GAMES_DIR=${ROMS_DIR}/terminal/
export SRC_BACKUP_DIR=${SRC_BACKUP_DIR:-/media/usb0/RetroPie-builds}

mkdir -p $GAMES_DIR $BUILD_ROOT
mkdir -p $SRC_BACKUP_DIR || export SRC_BACKUP_DIR=/dev/null  # no backup

# hedgewars
function install_hedgewars() {
  pushd $(pwd)
  sudo apt-get install -y clang haskell-stack ghc libghc-vector-dev libghc-network-dev \
    libghc-sandi-dev libghc-hslogger-dev libghc-utf8-string-dev libghc-sha-dev \
    libghc-entropy-dev libghc-zlib-dev libghc-random-dev libghc-regex-tdfa-dev \
    lua50 liblua50-dev qttools5-dev-tools qttools5-dev qtbase5-dev
  git clone https://github.com/hedgewars/hw.git
  cd hw
  cmake . || cmake . -DLUA_SYSTEM=off
  sudo wget https://raw.githubusercontent.com/pastpages/pastpages.org/master/phantomjs/src/qt/src/corelib/io/qabstractfileengine_p.h \
    -O /usr/include/arm-linux-gnueabihf/qt5/QtCore/qabstractfileengine_p.h
  sudo sed -i -r 's|"QtCore/(.*[.]h)"|<QtCore/\1>|' /usr/include/arm-linux-gnueabihf/qt5/QtCore/qabstractfileengine_p.h
  sudo wget https://raw.githubusercontent.com/radekp/qt/master/src/corelib/io/qabstractfileengine.h \
    -O /usr/include/arm-linux-gnueabihf/qt5/QtCore/qabstractfileengine.h
  sed -i -r 's|<(private/).*[.]h)>|<QtCore/\1>|' QTfrontend/util/FileEngine.h
  make -j4
  sudo make install && cd .. && mv hw  $SRC_BACKUP_DIR/ && \
    echo "hedgewars" > $GAMES_DIR/hedgewars.sh && chmod +x $GAMES_DIR/hedgewars.sh
  popd
}

# cylindrix
function install_cylindrix() {
  sudo apt-get install -y libyaml-dev
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://github.com/hyperlogic/cylindrix && \
    cd cylindrix && \
    make && \
    cd - && mv cylindrix $GAME_DIR/ && \
    echo "$GAMES_DIR/cylindrix/cylindrix" > $GAMES_DIR/cylindrix.sh && \
    chmod +x $GAMES_DIR/cylindrix.sh
  popd
}

#  voxelands
function install_voxelands() {
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://gitlab.com/voxelands/voxelands
  cd $BUILD_ROOT/voxelands && git pull
  cmake -DRUN_IN_PLACE=1 . || cmake .
  make -j4
  sudo make install && cd .. && mv voxelands $SRC_BACKUP_DIR/ && \
    echo "voxelands" > $GAMES_DIR/voxelands.sh && chmod +x $GAMES_DIR/voxelands.sh
  popd
}

# free orion
function install_freeorion() {
  sudo apt-get install -y freeorion
  echo "freeorion" > $GAMES_DIR/freeorion.sh && chmod +x $GAMES_DIR/freeorion.sh
}

# glPortal
function install_glPortal() {
  pushd $(pwd)
  git clone https://github.com/GlPortal/glPortal.git
  cd glPortal
  git submodule update --init --recursive
  cmake -DRADIX_ENABLE_PROFILER=OFF .
  make -j4
  sudo make install && cd .. && mv glPortal $SRC_BACKUP_DIR/ && 
    echo "glPortal" > $GAMES_DIR/voxelands.sh && chmod +x $GAMES_DIR/voxelands.sh
  popd
}

# wizznic
function install_wizznic() {
  # pushd $(pwd)
  # git clone https://github.com/DusteDdk/Wizznic
  # cd Wizznic
  # make -f Makefile.linux -j4 && cd .. && mv Wizznic $GAMES_DIR && \
  #   echo "$GAMES_DIR/wizznic" > $GAMES_DIR/wizznic.sh && chmod +x $GAMES_DIR/wizznic.sh
  # popd
  sudo apt-get install -y wizznic
  echo "wizznic" > $GAMES_DIR/wizznic.sh && chmod +x $GAMES_DIR/wizznic.sh
}

# zaz - Zuma clone
function install_zaz() {
  # pushd $(pwd)
  # sudo apt-get install -y libftgl-dev
  # wget http://sourceforge.net/projects/zaz/files/zaz-1.0.0.tar.bz2/download -O zaz-1.0.0.tar.bz2
  # tar -xjf zaz-1.0.0.tar.bz2 zaz-1.0.0/
  # cd zaz-1.0.0
  # ./configure && sed -i -r 's/^LIBS = (.*)/LIBS = \1 -lvorbis/g' Makefile && make -j4
  # sudo make install && cd .. && mv zaz-1.0.0/ $SRC_BACKUP_DIR/ && \
  #   echo "zaz" > $GAMES_DIR/zaz.sh && chmod +x $GAMES_DIR/zaz.sh
  # popd
  sudo apt-get install -y zaz
  echo "zaz" > $GAMES_DIR/zaz.sh && chmod +x $GAMES_DIR/zaz.sh
}

function install_apt_games() {
  sudo apt-get install -y "
  7kaa
  0ad
  abe
  abuse
  abuse-sfx
  adonthell
  adanaxisgpl
  airstrike
  alex4
  allure
  amphetamine
  amoebax
  angrydd
  atomix
  attal
  asc
  asc-music
  atanks
  ballerburg
  ballz
  barrage
  battleball
  beneath-a-steel-sky
  berusky
  billard-gl
  biloba
  biniax2
  bloboats
  boswars
  bovo
  brainparty
  briquolo
  btanks
  bubbros
  burgerspace
  bygfoot
  castle-combat
  ceferino
  cgoban
  colossal-cave-adventure
  connectagram
  crack-attack
  crimson
  csmash
  cube2
  cultivation
  cutemaze
  cuyo
  ddnet
  dodgindiamond2
  drascula
  einstein
  edgar
  el-ixir
  empire
  endless-sky
  endless-sky-high-dpi
  enigma
  epiphany
  etw
  ezgo-games
  filler
  flight-of-the-amazon-queen
  freedroid
  freedroidrpg
  freegish
  freeorion
  frozen-bubble
  funguloids
  funnyboat
  galois
  gav
  gbatnav
  gbrainy
  gearhead-sdl
  gearhead2
  geki2
  geki3
  gemdropx
  ghex
  gigalomania
  glob2
  glpeces
  gmchess
  gmult
  gnome-breakout
  gnome-klotski
  gnome-mahjongg
  gnome-mastermind
  gnome-mines
  gnome-nibbles
  gnome-robots
  gnome-sudoku
  gnome-taquin
  gnome-tetravex
  gnubg
  gnubik
  gnuchess
  gnugo
  gnujump
  gnurobbo
  gnustep-games
  gomoku.app
  gpe-lights
  gravitywars
  groundhog
  grhino
  gridlock.app
  gsoko
  gtkatlantic
  gtkballs
  gtkboard
  gweled
  hannah
  heroes
  heroes-sound-effects
  heroes-sound-tracks
  hex-a-hop
  hexalate
  hexxagon
  hitori
  ho22bus
  holotz-castle
  hyperrogue
  hyperrogue-music
  iagno
  ii-esu
  jag
  jester
  jumpnbump
  jumpnbump-levels
  junior-games-adventure
  junior-games-arcade
  junior-games-card
  junior-games-gl
  junior-games-net
  junior-games-puzzle
  junior-games-sim
  junior-math
  kanatest
  kapman
  kdegames
  kgeography
  kgoldrunner
  khangman
  kigo
  kiriki
  knavalbattle
  kolf
  kollision
  komi
  kpat
  kraptor
  kreversi
  ksirk
  ksnakeduel
  ksquares
  late
  lbreakout2
  lgeneral
  liquidwar
  lix
  lmarbles
  londonlaw
  lugaru
  luola
  luola-levels
  ltris
  madbomber
  maelstrom
  magicor
  mah-jong
  magicmaze
  mancala
  mame-data
  marsshooter
  mazeofgalious
  megaglest
  meritous
  mirrormagic
  miceamaze
  monsterz
  moon-buggy
  moon-lander
  moria
  naev
  nethack-x11
  nikwi
  numptyphysics
  oolite
  oneisenough
  open-adventure
  open-invaders
  overgod
  pachi
  pairs
  passage
  peg-solitaire
  penguin-command
  pentobi
  picmi
  pingus
  pink-pony
  pioneers
  pipenightdreams
  pipewalker
  pixfrogger
  pixbros
  planetblupi
  plee-the-bear
  pokerth
  pong2
  primrose
  pushover
  pynagram
  pyracerz
  pyscrabble
  raincat
  realtimebattle
  redeclipse
  ri-li
  scorched3d
  sgt-puzzles
  singularity
  singularity-music
  slashem-sdl
  slimevolley
  slingshot
  snowballz
  solarwolf
  sopwith
  spacearyarya
  spacezero
  spout
  starfighter
  starvoyager
  stax
  sugar-pippy-activity
  supertransball2
  teeworlds
  teg
  thrust
  tictactoe-ng
  titanion
  tmw
  tomatoes
  toppler
  torcs
  torus-trooper
  triplane
  triplea
  trophy
  tuxfootball
  tuxpuck
  typespeed
  ufoai-*
  vectoroids
  viruskiller
  vodovod
  vor
  warmux
  warzone2100*
  wesnoth
  widelands
  wing
  wizznic
  wordwarvi
  xbattle
  xchain
  xevil
  xfrisk
  xgalaga
  xjig
  xletters
  xmille
  xmoto
  xonix
  xpat2
  xracer
  xscavenger
  xskat
  xsok
  xsol
  xsoldier
  xtron
  xwelltris
  xye
  zatacka
  zaz
  zivot
  play.it
  pokemmo
  runescape
  "
  
  no_install=$(echo "
  ghextris
  balazar
  balazar3-*
  balazarbrothers
  " | tr '\n' ' ')