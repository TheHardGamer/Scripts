#!/bin/bash

sudo apt install repo
sudo apt install ccache
sudo apt install make
git clone https://github.com/akhilnarang/scripts
cd scripts
cd setup
bash ubuntu1604linuxmint18.sh
mkdir ~/aex
cd ~/aex
repo init -u https://github.com/varunhardgamer/manifest -b 7.x
repo sync -c -j128 --force-sync --no-clone-bundle --no-tags
git clone https://github.com/varunhardgamer/android_device_lenovo_a6000_x32 -b cm-14.1 device/lenovo/a6000
git clone https://github.com/varunhardgamer/android_device_lenovo_msm8916-common_x32 -b cm-14.1 device/lenovo/msm8916-common
git clone https://github.com/A6000-N/kernel_lenovo_msm8916_x32 -b Lineage-14.1 kernel/lenovo/a6000
git clone https://github.com/A6000-N/proprietary-vendor_lenovo_x32 -b cm-14.1 vendor/lenovo
rm -rf device/lenovo/a6000/sepolicy
rm -rf device/lenovo/msm8916-common/sepolicy
#Huihuihui
source build/envsetup.sh
lunch aosp_a6000-userdebug
mka aex -j128
