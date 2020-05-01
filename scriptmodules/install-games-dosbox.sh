#! /bin/bash
#################
### DOS games ###
#################
export BUILD_ROOT=${BUILD_ROOT:-/tmp/}
export ROMS_DIR=${ROMS_DIR:=~/RetroPie/roms}
export GAMES_DIR=${ROMS_DIR}/pc/

mkdir -p $GAMES_DIR $BUILD_ROOT

# get some key dependencies and awesome cmdline games
sudo apt-get install -y dosbox

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

