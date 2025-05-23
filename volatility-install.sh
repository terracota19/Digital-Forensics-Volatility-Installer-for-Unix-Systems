#!/bin/bash

sudo apt update
sudo apt install -y python2.7 python2.7-dev python2-pip build-essential curl \
    libdistorm3-dev libcapstone-dev capstone-tool libraw1394-11 yara

sudo python2.7 -m pip install --upgrade pip
sudo pip2 install --upgrade setuptools wheel
sudo pip2 install pycryptodome distorm3==3.3.4 yara-python==3.8.1 pillow openpyxl ujson pytz ipython capstone

cd ~/
mkdir -p scripts && cd scripts

if [ ! -d "volatility" ]; then
    git clone https://github.com/volatilityfoundation/volatility.git
fi

cd volatility
sudo python2.7 setup.py install

sudo ln -s ~/scripts/volatility/vol.py /usr/local/bin/volatility

if [ -f /usr/local/lib/python2.7/dist-packages/yara/libyara.so ]; then
    sudo ln -s /usr/local/lib/python2.7/dist-packages/yara/libyara.so /usr/lib/libyara.so
else
    echo "libyara.so no encontrado. Verifica la instalación de yara-python."
fi

