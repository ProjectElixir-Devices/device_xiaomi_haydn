echo 'Starting to clone stuffs needed to build for Haydn'

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b fourteen-leica vendor/xiaomi/haydn-miuicamera
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

echo 'delete vendorsetup.sh from device tree once this is done'
