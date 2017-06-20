#!/bin/bash

echo "Making directory for cloning JDC"
mkdir jdc
cd jdc
echo "Into the directory now Initiating clone"
repo init -u git://github.com/AOSP-JF-MM/platform_manifest.git -b aosp-7.1.2
echo "repo initialisation complete now cloning"
repo sync
echo "Cloned JDC successfully"
echo "Cloning needed msm8916 hals from DU"
git clone https://github.com/DirtyUnicorns/android_hardware_qcom_audio -b n7x-caf-8916 hardware/qcom/audio-caf/msm8916
git clone https://github.com/DirtyUnicorns/android_hardware_qcom_media -b n7x-caf-8916 hardware/qcom/media-caf/msm8916
git clone https://github.com/DirtyUnicorns/android_hardware_qcom_display -b n7x-caf-8916 hardware/qcom/display-caf/msm8916
echo "cloned needed hals from du successfully"
echo "cloning hardware/cyanogen"
git clone https://github.com/LineageOS/android_hardware_cyanogen -b cm-14.1 hardware/cyanogen
echo "msm8916 environment setup done"
echo "clone needed device repos and you are good to go"

