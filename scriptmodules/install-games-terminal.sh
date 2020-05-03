#! /bin/bash
##########################
### command line games ###
##########################
export BUILD_ROOT=${BUILD_ROOT:-/tmp/}
export ROMS_DIR=${ROMS_DIR:=~/RetroPie/roms}
export GAMES_DIR=${ROMS_DIR}/terminal/

mkdir -p $GAMES_DIR $BUILD_ROOT

# get some key dependencies and awesome cmdline games
sudo apt-get install -y libsdl2-mixer-2.0 libsdl2-2.0
sudo apt install -y bastet ninvaders pacman4console nsnake greed bsdgames moon-buggy cavezofphear \
  curseofwar empire nudoku nethack-x11 nethack-console asciijump bombardier angband gnuchess
sudo apt install -y cataclysm-dda-curses cataclysm-dda-sdl
wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
gcc -o 2048 2048.c && mkdir -p ~/bin && mv 2048 ~/bin/

# adom
cd $BUILD_ROOT
wget https://www.adom.de/home/download/current/adom_linux_arm_3.3.3.tar.gz -o adom-cli.tar.gz
tar -xzf adom-cli.tar.gz && rm adom-cli.tar.gz
mv $BUILD_ROOT/adom $GAMES_DIR/
echo """
export TERMINFO=/usr/share/terminfo
export TERM=xterm-basic
$GAMES_DIR/adom/adom
""" > $GAMES_DIR/adom.sh
chmod +x $GAMES_DIR/adom.sh

# abura tan
# role playing
# A roguelike game of Cowboy Knights and Lurking Horror.
cd $BUILD_ROOT
#wget https://sourceforge.net/projects/aburatan/files/aburatan/v0.A11/atsrca11.zip/download -O atsrca11.zip
wget https://sourceforge.net/projects/aburatan/files/aburatan/v0.A11/atbina11.zip/download -O abura_tan.zip
unzip abura_tan.zip && rm abura_tan.zip
mv abura_tan $ROMS_DIR/pc/abura_tan
cat > $ROMS_DIR/pc/"Abura Tan.sh" << EOF
#!/bin/bash
/opt/retropie/emulators/dosbox/bin/dosbox -c "mount c /home/pi/RetroPie/roms/pc" -c "c:" -c "cd abura_tan" -c "aburatan.exe" -c "exit"
EOF
chmod +x $ROMS_DIR/pc/"Abura Tan.sh"

# aliensrl
# freeware
wget https://alien.chaosforge.org/file_download/9/aliensrl-win-082.zip -O aliensrl.zip
unzip aliensrl.zip && rm aliensrl.zip
mv aliensrl-* $ROMS_DIR/pc/aliensrl
cat > $ROMS_DIR/pc/"AliensRL.sh" << EOF
#!/bin/bash
/opt/retropie/emulators/dosbox/bin/dosbox -c "mount c /home/pi/RetroPie/roms/pc" -c "c:" -c "cd aliensrl" -c "abrl.exe" -c "exit"
EOF 
chmod +x $ROMS_DIR/pc/"AliensRL.sh"

# beast
# freeware
cd $BUILD_ROOT
wget https://peteg.org/beasts/other/beast.zip
mkdir beast && cd beast && unzip ../beast.zip && cd - && rm beast.zip
mv beast $ROMS_DIR/pc/
cat > $ROMS_DIR/pc/Beast.sh << EOF
#!/bin/bash
/opt/retropie/emulators/dosbox/bin/dosbox -c "mount c /home/pi/RetroPie/roms/pc" -c "c:" -c "cd beast" -c "run_cd.bat" -c "exit"
EOF 
chmod +x $ROMS_DIR/pc/Beast.sh

# dwarf fortress
# freeware
cd $BUILD_ROOT
wget https://www.bay12games.com/dwarves/df_47_04_legacy.zip
mkdir df && cd df && unzip ../df_47_04_legacy.zip
cd - && mv df $ROMS_DIR/pc/
cat > $ROMS_DIR/pc/"Dwarf Fortress".sh << EOF
#!/bin/bash
/opt/retropie/emulators/dosbox/bin/dosbox -c "mount c /home/pi/RetroPie/roms/pc" -c "c:" -c "cd df" -c "Dwarf Fortress.exe" -c "exit"
EOF 
chmod +x $ROMS_DIR/pc/"Dwarf Fortress".sh

# diablorl
# freeware
wget https://diablo.chaosforge.org/file_download/11/diablorl-win-050.zip
unzip diablorl-win-050.zip && rm diablorl-win-050.zip 
mv diablorl-win-050 $ROMS_DIR/pc/diablorl
cat > $ROMS_DIR/pc/DiabloRL.sh << EOF
#!/bin/bash
/opt/retropie/emulators/dosbox/bin/dosbox -c "mount c /home/pi/RetroPie/roms/pc" -c "c:" -c "cd diablorl" -c "rl.exe" -c "exit"
EOF 
chmod +x $ROMS_DIR/pc/DiabloRL.sh


# ad-astra
cd $BUILD_ROOT
wget https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/ad-astra-game/source-archive.zip -O ad-astra.zip
unzip -f ad-astra.zip
mv ad-astra-game/trunk/ $GAMES_DIR/ad-astra
echo """#! /bin/sh
cd $GAMES_DIR/ad-astra
python astra.py
""" > $GAMES_DIR/ad-astra.sh
rm -rf $BUILD_ROOT/ad-astra-game  # tidy up
cd -

# asciisector
cd $BUILD_ROOT
wget http://www.laserbrainstudios.com/download.php?name=asciisecwin -O asciisec.zip
unzip asciisec



# asciiportal
# It's like portal, but in ASCII. And 2D. Sweet look-through mechanic, tho.
# GNU General Public License v3.0
sudo apt-get -y libyaml-cpp-dev make g++ git cmake libxaw7-dev
cd $BUILD_ROOT
git clone --depth=1 https://github.com/cymonsgames/ASCIIpOrtal
make -f Makefile.default PDCurses-3.4/sdl1/libpdcurses.a -j4
wget https://raw.githubusercontent.com/mattn/pdcurses/master/sdl1/pdcsdl.h -O src/pdcsdl.h
wget https://raw.githubusercontent.com/mattn/pdcurses/master/curspriv.h -O src/curspriv.h 
cd PDCurses-3.4 && ./configure --x-libraries=/usr/lib/arm-linux-gnueabihf/
make -f Makefile.linux asciiportal -j4

# beasts
# GPLv2
cd $BUILD_ROOT
beasts_version=0.1.0
wget https://peteg.org/beasts/beasts-${beasts_version}.tar.gz
tar -xvzf beasts-${beasts_version}.tar.gz && rm beasts-${beasts_version}.tar.gz
cd beasts-${beasts_version}/ && make -f GNUmakefile && cd -
mv beasts-${beasts_version}/ $GAMES_DIR/
cat > $ROMS_DIR/pc/Beasts.sh << EOF
#!/bin/bash
cd $GAMES_DIR/beasts && bin/beasts.sh
EOF 
chmod +x $ROMS_DIR/pc/Beasts.sh

# battleships
sudo apt-get install -y libncurses-dev
cd $BUILD_ROOT
bs_version=2.11
wget http://www.catb.org/~esr/bs/bs-${bs_version}.tar.gz
tar -xvzf bs-${bs_version}.tar.gz && rm bs-${bs_version}.tar.gz
cd bs-${bs_version} && make && cd - && mv bs-${bs_version} $GAMES_DIR/
cat > $ROMS_DIR/pc/Battleships.sh << EOF
#!/bin/bash
cd $GAMES_DIR/bs-${bs_version}
bs
EOF 
chmod +x $ROMS_DIR/pc/Battleships.sh

# chimaera
cd $BUILD_ROOT
wget https://www.mipmip.org/chimaera/chimaera.tgz
tar -xvzf chimaera.tgz && rm chimaera.tgz 
cd chimaera && gcc chimaera.c -o chimaera -lm -std=c99 && cd -
mv chimaera/ $GAMES_DIR/
cat > $ROMS_DIR/pc/chimaera.sh << EOF
#!/bin/bash
$GAMES_DIR/chimaera/chimaera
EOF 
chmod +x $ROMS_DIR/pc/chimaera.sh

# chroma
# GPLv2
# Chroma is an abstract puzzle game. A variety of colourful shapes are arranged in a series of increasingly complex patterns, forming fiendish traps that must be disarmed and mysterious puzzles that must be manipulated in order to give up their subtle secrets. Initially so straightforward that anyone can pick it up and begin to play, yet gradually becoming difficult enough to tax even the brightest of minds. 
sudo apt-get install -y libsdl1.2-dev libsdl-console libsdl-image1.2-dev
cd $BUILD_ROOT
chroma_version=1.17
wget http://www.level7.org.uk/chroma/download/chroma-${chroma_version}.tar.bz2
tar -xvjf chroma-${chroma_version}.tar.bz2 && rm chroma-${chroma_version}.tar.bz2
cd chroma-${chroma_version}/
./configure
make chroma-curses
# patch undefined references due to incorrect use of inline void
sed -i 's/inline void displayshadowed_piece/void displayshadowedls_piece/g' sdlshadowdisplay.c
sed -i 's/inline void displayshadowed_piecebase/void displayshadowed_piecebase/g' sdlshadowdisplay.c
make chroma-sdl
sudo make install
cd - && rm -rf $BUILD_ROOT/chroma-${chroma_version}
cat > $GAMES_DIR/chroma-curses.sh << EOF
#!/bin/bash
chroma-curses
EOF 
chmod +x $GAMES_DIR/chroma-curses.sh
cat > $GAMES_DIR/chroma.sh << EOF
#!/bin/bash
chroma
EOF 
chmod +x $GAMES_DIR/chroma.sh

# cgames
# sudo apt-get install -y gcc libdpm-dev make
# cd $BUILD_ROOT
# cgames_version=2.2b
# wget http://www.muppetlabs.com/~breadbox/pub/software/cgames-${cgames_version}.tar.gz
# tar -xvzf cgames-${cgames_version}.tar.gz && rm cgames-${cgames_version}.tar.gz
# cd cgames-${cgames_version} && make && sudo make install

# conquest
sudo apt-get install -y make git gcc
cd $BUILD_ROOT
git clone --depth=1 https://github.com/beejjorgensen/conquest
cd conquest
make
gcc *.o -o conquest -lm -lcurses  # patch undefined references due to incorrect linker flag order
mkdir -p ~/bin/
cp conquest ~/bin/
cd -
rm -rf $BUILD_ROOT/conquest
cat > $GAMES_DIR/conquest.sh << EOF
#!/bin/bash
~/bin/conquest
EOF 
chmod +x $GAMES_DIR/conquest.sh

# cursedmate
wget https://web.archive.org/web/20130804035452/http://www.uberwall.org/~dash/cmate-0.1b.tar.bz2
tar -xvjf cmate-0.1b.tar.bz2
cd cursedmate-0.1b && sed -i 's/\t/        /g' *.py
cd -

# cpat
sudo apt-get install -y make libncursesw5-dev
wget 'https://downloads.sourceforge.net/project/cpat/cpat/1.4.1/cpat-1.4.1.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcpat%2Ffiles%2Flatest%2Fdownload&ts=1588330230' -O cpat-1.4.1.tar.gz
tar -xvzf cpat-1.4.1.tar.gz && rm cpat-1.4.1.tar.gz
cd cpat-1.4.1 && ./configure && make && mkdir -p ~/bin/ && mv src/cpat ~/bin/
cd - && rm -rf cpat-1.4.1
cat > $GAMES_DIR/conquest.sh << EOF
#!/bin/bash
~/bin/cpat
EOF 
chmod +x $GAMES_DIR/cpat.sh

# crawl
# GPLv2+
# Dungeon Crawl Stone Soup is a game of dungeon exploration, combat and magic, involving characters of diverse skills, worshipping deities of great power and caprice. To win, you'll need to be a master of tactics and strategy, and prevail against overwhelming odds.
sudo apt-get -y install build-essential git \
    libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev luajit \
    libpcre3-dev libpcre++-dev libfreetype6-dev fonts-dejavu-extra \
    libncursesw5-dev bison flex liblua5.1-0-dev \
    libsqlite3-dev libz-dev pkg-config python3-yaml binutils-gold
    libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev \
    libfreetype6-dev libpng-dev ttf-dejavu-core advancecomp pngcrush
cd $BUILD_ROOT
git clone --depth=1 https://github.com/crawl/crawl  # approx 2 MB download 
cd crawl/crawl-ref/source
git submodule update --init
make -j4 TILES=y
ls

# doomrl
# sudo apt-get install -y lua5.1 git fp-compiler libsdl2-image-dev libsdl2-mixer-dev libsdl2-dev liblua5.1-0-dev
# git clone https://github.com/chaosforgeorg/fpcvalkyrie
# git clone --depth=1 https://github.com/chaosforgeorg/doomrl

# gnuski
sudo apt-get install -y git gcc make wget libncurses-dev
cd $BUILD_ROOT
wget 'https://downloads.sourceforge.net/project/gnuski/gnuski/gnuski-0.3/gnuski-0.3.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fgnuski%2Ffiles%2Flatest%2Fdownload&ts=1588326448' -O gnuski-0.3.tar.gz
tar -xvzf gnuski-0.3.tar.gz && rm gnuski-0.3.tar.gz 
cd gnuski-0.3/ && make
mkdir -p ~/bin/ && cp gnuski ~/bin/
cd - && rm -rf gnuski-0.3
cat > $GAMES_DIR/gnuski.sh << EOF
#!/bin/bash
read -p "Press CTRL+C to quit" key
while [ 1 ]; do
  if [ "$key" == 'q' ]; then
    break
  fi
  ~/bin/gnuski
done
EOF 
chmod +x $GAMES_DIR/gnuski.sh


# galaxis
# BSD
# GALAXIS for UNIX by Eric S. Raymond
cd $BUILD_ROOT
git clone --depth=1 https://gitlab.com/esr/galaxis
cd galaxis && make && mkdir -p ~/bin && mv galaxis ~/bin/
cd - && rm -rf $BUILD_ROOT/galaxis
cat > $GAMES_DIR/galaxis.sh << EOF
#!/bin/bash
~/bin/galaxis
EOF 
chmod +x $GAMES_DIR/galaxis.sh

# enigma
cd $BUILD_ROOT
wget https://www.chiark.greenend.org.uk/~sgtatham/enigma/enigma-1.04.tar.gz
tar -xvzf enigma-1.04.tar.gz
cd enigma-1.04 && ./configure && make && mkdir -p ~/bin/ && mv enimga ~/bin/
cd -
cat > $GAMES_DIR/enigma.sh << EOF
#!/bin/bash
~/bin/enigma
EOF 
chmod +x $GAMES_DIR/enigma.sh

# hinversi
cd $BUILD_ROOT
wget 'https://downloads.sourceforge.net/project/hinversi/latest/hinversi-0.8.2.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fhinversi%2Ffiles%2Flatest%2Fdownload&ts=1588331621' -O hinversi-0.8.2.tar.gz
tar -xvzf hinversi-0.8.2.tar.gz && rm hinversi-0.8.2.tar.gz
cd hinversi-0.8.2 && ./configure && make && mkdir ~/bin && mv human-cli/hinversi-cli ~/bin/
cd - && rm -rf hinversi-0.8.2
cat > $GAMES_DIR/hinversi.sh << EOF
#!/bin/bash
~/bin/hinversi-cli
EOF 
chmod +x $GAMES_DIR/hinversi.sh

# hunt-ng
cat > $GAMES_DIR/hunt-ng.sh << EOF
#! /bin/bash
sshpass -p kalte ssh -o StrictHostKeyChecking=no hunt@sshgames.thegonz.net
EOF
chmod +x $GAMES_DIR/hunt-ng.sh

# intricacy
#sshpass -p intricacy ssh -o StrictHostKeyChecking=no intricacy@sshgames.thegonz.net

# rhex
cd $BUILD_ROOT
source $HOME/.cargo/env
if [ ! -f `which cargo` ]; then
  curl https://sh.rustup.rs -sSf > install-rust.sh && bash install-rush.sh -y && rm install-rust.sh
fi
git clone https://github.com/dpc/rhex
make

# ttysolitaire
cd $BUILD_ROOT
wget -O tty-solitaire-v1.1.0.tar.gz https://github.com/mpereira/tty-solitaire/archive/v1.1.0.tar.gz
tar xvf tty-solitaire-v1.1.0.tar.gz && rm tty-solitaire-v1.1.0.tar.gz
cd tty-solitaire-1.1.0 && make && sudo make install
cd - && rm -rf $BUILD_ROOT/tty-solitaire-1.1.0
cat > $GAMES_DIR/tty-solitaire.sh << EOF
#! /bin/bash
ttysolitaire
EOF
chmod +x $GAMES_DIR/tty-solitaire.sh

# taipan
sudo apt-get install -y make gcc wget libncurses-dev
cd $BUILD_ROOT
wget http://www.ibiblio.org/pub/linux/games/textrpg/taipan-0.9.tar.gz
tar -xvzf taipan-0.9.tar.gz && rm taipan-0.9.tar.gz 
cd taipan-0.9/ && make && sudo make install
cd - && rm -rf taipan-0.9
cat > $GAMES_DIR/taipan.sh << EOF
#! /bin/bash
taipan
EOF
chmod +x $GAMES_DIR/taipan.sh

# sst2k
sudo apt-get install -y xmlto git make
cd $BUILD_ROOT
git clone --depth=1 git://git.code.sf.net/p/sst2k/code sst2k-code
cd sst2k-code/ && make && sudo make install
cd - && rm -rf sst2k-code
cat > $GAMES_DIR/"Super Star Trek Remake".sh << EOF
#! /bin/bash
python2.7 `which sst2k.py`
EOF
chmod +x $GAMES_DIR/"Super Star Trek Remake".sh

# seabattle
cd $BUILD_ROOT
wget http://www.deater.net/weave/vmwprod/seabattle-1.0.tar.gz
tar -xvzf seabattle-1.0.tar.gz && rm seabattle-1.0.tar.gz
cd seabattle-1.0/ && make && mkdir -p ~/bin && mv seabattle ~/bin/
cd - && rm -rf $BUILD_ROOT/seabattle-1.0
cat > $GAMES_DIR/"SeaBattle".sh << EOF
#! /bin/bash
~/bin/seabattle
EOF
chmod +x $GAMES_DIR/"SeaBattle".sh

# plonx
cd $BUILD_ROOT
curl -O -J -L https://web.archive.org/web/20080704073046/http://bilious.homelinux.org/~paxed/plonx/plonx-0.03.tar.gz
tar -xvzf plonx-0.03.tar.gz && rm plonx-0.03.tar.gz
cd plonx-0.03/ && make && mkdir -p ~/bin/ && mv plonx ~/bin/
cd - && rm -rf plonx/
cat > $GAMES_DIR/plonx.sh << EOF
#! /bin/bash
while [ 1 ]; do
  read -p "Press 'q' or CTRL+C to quit" key
  if [ "$key" == 'q' ]; then
    break
  fi
  ~/bin/plonx
done
EOF
chmod +x $GAMES_DIR/plonx.sh

# n2048 - ncurses based 2048
cd $BUILD_ROOT && git clone https://github.com/blindFS/n2048 && \
  cd n2048/ && make && mkdir -p ~/bin && mv ~/bin/2048 && cd - && rm -rf n2048
echo '''#!/bin/sh
read -p "Press ENTER to start game (CTRL+C or 'q' quits) " var
~/bin/n2048''' > ~/RetroPie/roms/terminal/n2048.sh
chmod +x ~/RetroPie/roms/terminal/n2048.sh

# brain curses
pushd $(pwd)
cd $BUILD_ROOT
git clone https://github.com/bderrly/braincurses && \
  cd braincurses && make && mkdir -p ~/bin/ && \
    mv braincurses ~/bin/ && cd .. && rm -rf braincurses
ln -s ~/bin/braincurses $GAMES_DIR/braincurses
echo -e '#!/bin/sh
read -p "Press ENTER to start game (CTRL+C quits) " var
braincurses' > $GAMES_DIR/braincurses.sh
chmod +x $GAMES_DIR/braincurses.sh
popd

# checkers mulitplayer
echo '#!/bin/sh
read -p "Press ENTER to start game (CTRL+C quits) " var
telnet -e ^C mud.darkerrealms.org 2000' > $GAMES_DIR/checkers_multiplayer.sh
chmod +x $GAMES_DIR/checkers_multiplayer.sh

# khet
echo '''#!/bin/sh
read -p "Press ENTER to start game (CTRL+C quits) - password is 'ckhet'" var
ssh ckhet@sshgames.thegonz.net''' >  $GAMES_DIR/ckhet.sh
chmod +x $GAMES_DIR/ckhet.sh

# astromenace
pushd $(pwd)
cd $BUILD_ROOT
git clone https://github.com/viewizard/astromenace
sudo apt-get install -y libalut-dev
cd $BUILD_ROOT/astromenace && git pull && cmake . && make -j4 && \
  cd .. && mv astromenace $GAMES_DIR/ && \
  echo "sudo $GAMES_DIR/astromenace/astromenace  # needs root... dunno why" > $GAMES_DIR/astromenace.sh && \
  chmod +x $GAMES_DIR/astromenace.sh
popd

# plonx
wget https://web.archive.org/web/20080704073046/http://bilious.homelinux.org/~paxed/plonx/plonx-0.03.tar.gz
tar -xvzf plonx-0.03.tar.gz && rm plonx-0.03.tar.gz
cd plonx-0.03/ && make 

# secret maryo
# pushd $(pwd)
# cd $BUILD_ROOT
# git clone http://github.com/FluXy/SMC 
# sudo apt-get install -y libcegui-mk2-dev freeglut3 freeglut3-dev libglew2.1 libglew-dev \
#   ogre-1.9-tools libminizip-dev libharfbuzz-bin libtinyxml2-dev libsilly-dev libcorona-perl \
#   librapidxml-dev libfribidi-bin libglfw-dev libsfml-dev libraqm-dev libepoxy-dev libirrlicht-dev
# cd ~/SMC/smc/ && git pull && ./autogen.sh && ./configure && make -j4
# popd

# pacman-ghosts
# pushd $(pwd)
# cd ~/
# sudo apt-get install -y libqt5quick5
# git clone
# popd

# pycraft
pushd $(pwd)
cd $BUILD_ROOT
sudo apt-get install -y python3-pip
git clone https://github.com/itsapi/pycraft
cd pycraft
python3 setup.py build
cd ..
mv pycraft $GAMES_DIR
echo "cd $GAMES_DIR/pycraft && python3 main.py" > $GAMES_DIR/pycraft.sh
popd

# python bowling
pip install blessed
wget https://raw.githubusercontent.com/haliphax/pybowl/master/bowling.py -O ~/RetroPie/roms/terminal/
chmod +x ~/RetroPie/roms/terminal/bowling.py

# xorcurses
function install_xorcurses() {
  pushd $(pwd)
  cd $BUILD_ROOT
  git clone https://github.com/jwm-art-net/XorCurses
  cd XorCurses/ && make && rm *.o && cd - && \
    mv $BUILD_ROOT/XorCurses $GAMES_DIR/ && \
    echo "$GAMES_DIR/XorCurses/xorcurses" $GAMES_DIR/XorCurses.sh && \
    chmod +x $GAMES_DIR/XorCurses.sh
  popd
}

# warzone 2100
# git clone https://github.com/Warzone2100/warzone2100.git
# cd warzone2100
# git submodule update --init --recursive

# add terminal system to RetroPie
cp /etc/emulationstation/es_systems.cfg /opt/retropie/configs/all/emulationstation/es_systems.cfg
term_xml=$(echo """<system>
    <name>terminal</name>
    <fullname>Terminal Games</fullname>
    <path>/home/pi/RetroPie/roms/terminal</path>
    <extension>.sh .bash .py .SH .BASH .PY</extension>
    <command>/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ terminal %ROM%</command>
    <platform>terminal</platform>
    <theme>terminal</theme>
</system>
""")
sed -ir "s|(</systemList>)|$term_xml\n\1|" /opt/retropie/configs/all/emulationstation/es_systems.cfg

# add terminal system theme
mkdir -p /opt/retropie/configs/all/emulationstation/themes
cp -r /etc/emulationstation/themes/carbon/ports /opt/retropie/configs/all/emulationstation/themes/terminal
wget https://www.svgrepo.com/download/64044/keyboard.svg -O \
  /opt/retropie/configs/all/emulationstation/themes/terminal/art/controller.svg
wget https://www.svgrepo.com/download/157307/console.svg -O \
  /opt/retropie/configs/all/emulationstation/themes/terminal/art/system.svg

# add terminal "emulator" entry so retropie know what to do
mkdir -p /opt/retropie/configs/terminal
echo 'shell = "bash %ROM$"
default = "shell"' > /opt/retropie/configs/terminal/emulators.cfg

# add games to terminal system
games=$(echo "2048
asciijump
angband
animals
atom4
bastet
bluemoon
boggle
bombardier
canfield
cataclysm
cavezofphear
crawl
curseofwar
dopewars
empire
freesweep
gnuchess
greed
instead
lambdahack
moon-buggy
nethack-console
ninvaders
nsnake
pacman4console
matanza
nudoku
n2048
omega-rpg
piu-piu
speedpad
tint
" |tr '\n' ' ')

non_apt_games=$(echo "
2048
bluemoon
boggle
canfield
cataclysm
n2048
" | tr '\n' ' ')

apt_games=$(echo -e "$games" | sed -r "s/$(echo $non_apt_games|tr ' ' '|')//g")
sudo apt-get install -y $apt_games

for game in $games; do
  echo "$game" > $GAMES_DIR/${game}.sh
done
