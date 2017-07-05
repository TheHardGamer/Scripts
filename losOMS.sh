#!/bin/bash
echo "Making Directory to sync lineage OS with OMS(Substratum) commits"
mkdir losOMS
cd losOMS
echo "Preparing to sync"
repo init -u https://github.com/LineageOMS/android.git -b cm-14.1
repo sync -c -f --force-sync --no-clone-bundle --no-tags -j64
echo "Sync complete Syncing device repos"
git clone https://github.com/dev-harsh1998/android_device_lenovo_a6000 -b cm-14.1-staging device/lenovo/a6000
git clone https://github.com/dev-harsh1998/kernel_lenovo_msm8916 -b cm-14.1-staging kernel/lenovo/a6000
git clone https://github.com/dev-harsh1998/proprietary-vendor_lenovo -b cm-14.1 vendor/lenovo
git clone https://github.com/LineageOS/android_device_qcom_common -b cm-14.1 device/qcom/common
git clone https://github.com/LineageOS/android_device_cyanogen_msm8916-common -b cm-14.1 device/cyanogen/msm8916-common
git clone https://github.com/LineageOS/android_external_stlport -b cm-14.1 external/stlport
echo "Snying Toolchains"
rm -rf  prebuilts/gcc/linux-x86/arm/*
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8 prebuilts/gcc/linux-x86/arm/arm-eabi-4.8
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
echo "Sync Complete"

echo "#########################################################"

echo "Writing compiletime script!!"

#####################-INLINE-SCRIPT-WRITING-############################
echo "#!/bin/bash" >> build.sh
echo "export USE_CCACHE=1" >> build.sh
echo "export CCACHE_DIR=/home/ccache/ssh_mayank" >> build.sh
echo "prebuilts/misc/linux-x86/ccache/ccache -M 50G" >> build.sh
echo "make clobber" >> build.sh
echo ". build/envsetup.sh" >> build.sh
echo "brunch a6000" >> build.sh
#####################-SCRIPT-WRITING-COMPLETE-###########################

echo "Writing upload script now!!"

########################-INLINE-UPLOADSCRIPT-############################
echo "#!/bin/bash" >> upload_ftp.sh
echo "curl -T out/target/product/a6000/line*a6000.zip ftp://uploads.androidfilehost.com --user ftpusername:PASSCODE" >> upload_ftp.sh
echo "upload to ftp complete" >> upload_ftp.sh
#########################################################################

echo "########################################################################################"

echo "Setting Permissions"

chmod +x build.sh && upload_ftp.sh

pwd

echo "Bye Script complete"
