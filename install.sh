#!/bin/sh

#---------
# packages 
#---------
# update
apt update

# utils
apt install -y unzip wget cmake x11-apps

# python
apt install -y python3 python3-pip python3-tk
pip3 install requests pydub opencv-python==4.4.0.46 tkinter

# open-jtalk
apt install open-jtalk open-jtalk-mecab-naist-jdic hts-voice-nitech-jp-atr503-m001
wget http://sourceforge.net/projects/mmdagent/files/MMDAgent_Example/MMDAgent_Example-1.7/MMDAgent_Example-1.7.zip
unzip MMDAgent_Example-1.7.zip
cp -r MMDAgent_Example-1.7/Voice/mei/ /usr/share/hts-voice/

# gstreamer
apt install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio libgstreamer1.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  libgtk2.0-dev

# OpenCV
mkdir OpenCV
cd OpenCV
wget https://github.com/opencv/opencv/archive/4.4.0.zip
unzip 4.4.0.zip
cd opencv-4.4.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -DINSTALL_PYTHON_EXAMPLES=ON -D INSTALL_C_EXAMPLES=ON -D　PYTHON_EXECUTABLE=/usr/bin/python3 -D BUILD_EXAMPLES=ON -D WITH_GTK=ON -D WITH_GSTREAMER=ON -D WITH_FFMPEG=OFF -D WITH_QT=OFF ..
make -j4
make install

cd installed
git clone https://github.com/scelab/robotcontroller-client.git
git clone https://github.com/scelab/robotcontroller-client-gui.git



