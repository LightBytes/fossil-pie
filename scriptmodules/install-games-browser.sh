# This script installs a number of browser based games into an existing RetroPie installation.
sudo apt-get install -y chromium

browser_game_launch="chromium --kiosk"

function install_browser_game() {
    local game="$1"
    local url="$2"
    local desc="$3"
    local destdir="${4:-~/RetroPie/roms/ports/}"

    mkdir -p $destdir
    cat > "$destdir/$game.sh" << EOF
#! /bin/bash
$browser_game_launch $url
EOF
    chmod +x "$destdir/$game.sh"
}

install_browser_game "The Wizard" https://hypnoticowl.com/games/the-wizard/play/ "A fun RPG."

install_browser_game "Little Alchemy" https://littlealchemy2.com/ "Start off with the four basic elements and combine them to create the 510 possible combinations."

install_browser_game "XType" https://phoboslab.org/xtype/ "Browser based R-Type like game."

install_browser_game "Pixel Race" https://ned.im/pixel-race-game/game.html "A game with awesome frame rates and a simple concept, in which you control a car to avoid obstacles, while collecting coins. If you have the patience and the free time you might become the best in the world (the record is 36309 coins)."

install_browser_game "Arena5" http://www.kevs3d.co.uk/dev/arena5/ "Fly around a digital field and shoot geometrical enemies to get a high score."

install_browser_game "Biolab Disaster" https://playbiolab.com/ "An awesome pixel art platformer where you have to escape a lab full of mutated creatures and other baddies."

install_browser_game "Game of Bombs" http://gameofbombs.com/landing "Online multiplayer bomb game."

install_browser_game "PolyCraft" https://ga.me/games/polycraft

install_browser_game "Entanglement" http://entanglement.gopherwoodstudios.com/en-US-index.html

install_browser_game "Swooop" https://playcanv.as/p/JtL2iqIH/ "Keep the plane from crashing."

install_browser_game "Sinuous" http://www.sinuousgame.com/

install_browser_game "Gods Will Be Watching" http://www.deconstructeam.com/games/gods-will-be-watching/

install_browser_game "Torus" https://www.benjoffe.com/code/games/torus "Pseudo-3D tetris."

install_browser_game "A Dark Room" http://adarkroom.doublespeakgames.com/ "Simple text based game"

install_browser_game "AI Dungeon" https://play.aidungeon.io/ "A text based D&D-like game with an 'artificial intelligence' dungeon master."