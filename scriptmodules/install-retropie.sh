sudo apt-get update -y
sudo apt-get install -y git gcc make g++ gfortran cmake

# install pre-requisites
sudo apt-get install -y \
  libudev-dev libxkbcommon-dev libsdl2-dev libasound2-dev libusb-1.0-0-dev \
  libgles2-mesa-dev libx11-xcb-dev libgbm-dev libavcodec-dev libavformat-dev libavdevice-dev \
  portaudio19-dev libsdl-image1.2-dev libsdl2-ttf-dev tcl-dev libboost-dev mercurial

# install retropie
cd ~/
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup
cd RetroPie-Setup
git fetch && git checkout fkms_rpi4
sudo ./retropie_setup.sh

# Install Steamlink
sudo apt-get -y install steamlink

#######################################################################
# Install virtual gamepad
#######################################################################
# install npm
sudo apt-get install -y build-essential python-dev nodejs npm
sudo npm cache clean -f
sudo npm install -g n
sudo n 9
sudo npm install -g npm
# clone repo
cd /
sudo git clone https://github.com/miroof/node-virtual-gamepads
cd node-virtual-gamepads
# install gamepad and set to start at boot
sudo npm install
sudo npm install pm2 -g
sudo pm2 start main.js
sudo pm2 startup
sudo pm2 save

# save config
sudo mkdir -p /opt/retropie/configs/all/retroarch-joypads/
echo """
input_device = "Virtual gamepad"
input_driver = "udev"
input_r_btn = "5"
input_save_state_btn = "5"
input_start_btn = "7"
input_exit_emulator_btn = "7"
input_l_btn = "4"
input_load_state_btn = "4"
input_up_axis = "-1"
input_a_btn = "0"
input_b_btn = "1"
input_reset_btn = "1"
input_down_axis = "+1"
input_right_axis = "+0"
input_state_slot_increase_axis = "+0"
input_x_btn = "2"
input_menu_toggle_btn = "2"
input_select_btn = "6"
input_enable_hotkey_btn = "6"
input_y_btn = "3"
input_left_axis = "-0"
input_state_slot_decrease_axis = "-0"
""" | sudo tee /opt/retropie/configs/all/retroarch-joypads/Virtualgamepad.cfg

# install unofficial extras
cd ~/
git clone https://github.com/Retroheim-base/RetroPie-Extra
./RetroPie-Extra/install-extras.sh

# customisation
mkdir -p ~/RetroPie/roms/kodi
echo "kodi-standalone" > "$HOME/RetroPie/roms/Kodi XMBC.sh" && \
  chmod +x "$HOME/RetroPie/roms/Kodi XMBC.sh"
mkdir -p /opt/retropie/configs/kodi
echo 'shell = "bash %ROM$"
default = "shell"' > /opt/retropie/configs/kodi/emulators.cfg

mkdir -p ~/RetroPie/roms/steamlink
echo '/opt/retropie/supplementary/runcommand/runcommand.sh 0 PORT "steamlink" ""' > "$HOME/RetroPie/roms/steamlink/Steam Link.sh" && \
  chmod +x "$HOME/RetroPie/roms/steamlink/Steam Link.sh"
mkdir -p /opt/retropie/configs/steamlink
echo 'shell = "bash %ROM$"
default = "shell"' > /opt/retropie/configs/steamlink/emulators.cfg

# TODO: edit /etc/emulationstation/systems.cfg and add kodi + steamlink
wget https://upload.wikimedia.org/wikipedia/commons/8/83/Steam_icon_logo.svg?download -o steam_icon_logo.svg