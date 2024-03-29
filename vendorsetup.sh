echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning Common device tree'
rm -rf device/xiaomi/sm8350-common
git clone --depth=1 https://github.com/ProjectElixir-Devices/device_xiaomi_sm8350-common -b udc-haydn device/xiaomi/sm8350-common

# Kernel
echo 'Cloning Kernel tree'
rm -rf kernel/xiaomi/sm8350
git clone --depth=1 https://github.com/ProjectElixir-Devices/kernel_xiaomi_sm8350 -b udc-haydn  kernel/xiaomi/sm8350

# Vendor
echo 'Cloning Vendor tree'
rm -rf vendor/xiaomi/haydn
git clone https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_haydn -b lineage-21 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning Common vendor tree'
rm -rf vendor/xiaomi/sm8350-common
git clone https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_sm8350-common -b lineage-21 vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning Firmware'
rm -rf vendor/xiaomi/haydn-firmware
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Xiaomi
echo 'Cloning Hardware xiaomi'
rm -rf hardware/xiaomi
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi

# Hardware-Display
rm -rf hardware/qcom-caf/sm8350/display
git clone https://github.com/Evolution-X/hardware_qcom-caf_sm8350_display -b udc hardware/qcom-caf/sm8350/display

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera  -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

# Leica patch
echo 'Adding Leica camera patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Leicamera/0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Leicamera/0002-Expose-aux-camera-if-packagename-is-null.patch
patch -p1 <0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
patch -p1 <0002-Expose-aux-camera-if-packagename-is-null.patch
cd ../..

# Audio
echo 'Adding audio-app support'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Audio-app-main/0001-Add-audio-app-support.patch
patch -p1 <0001-Add-audio-app-support.patch
cd ../..

echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

echo 'Adding optimization patch'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0001-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0002-Tune-F2FS-and-dirty-writeout-policy-for-modern-devices.patch
patch -p1 <0001-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0002-Tune-F2FS-and-dirty-writeout-policy-for-modern-devices.patch
cd ../..

cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0003-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0004-Remove-USB-charging-notification.patch
patch -p1 <0003-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0004-Remove-USB-charging-notification.patch
cd ../..

# libprotobuf-ccq
rm -rf hardware/lineage/compat
git clone https://github.com/LineageOS/android_hardware_lineage_compat -b lineage-21.0 hardware/lineage/compat 

rm -rf vendor/qcom/opensource/vibrator
git clone --depth=1 https://github.com/PixelExperience/vendor_qcom_opensource_vibrator vendor/qcom/opensource/vibrator

echo 'delete vendorsetup.sh from device tree once this is done'
