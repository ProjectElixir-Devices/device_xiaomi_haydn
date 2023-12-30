echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree'
rm -rf device/xiaomi/sm8350-common
git clone https://github.com/xiaomi-haydn-devs/android_device_xiaomi_sm8350-common -b lineage-21 device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree'
rm -rf device/xiaomi/sm8350-common
git clone --depth=1 https://github.com/ProjectElixir-Devices/device_xiaomi_sm8350-common -b udc-haydn device/xiaomi/sm8350-common

# Vendor
echo 'Cloning vendor tree'
vendor/xiaomi/haydn
git clone --depth=1 https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_haydn -b lineage-21 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning common vendor tree'
rm -rf vendor/xiaomi/sm8350-common
git clone --depth=1 https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_sm8350-common -b lineage-21 vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning firmware'
rm -rf vendor/xiaomi/haydn-firmware
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
rm -rf vendor/xiaomi/haydn-miuicamera
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

echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

# Audio
echo 'Adding Dolby patch'
cd frameworks/av
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0001-Add-support-for-loading-prebuilt-ddp-and-ac4-decoder-lib.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0004-Import-Dolby-Effects-initialization.patch
patch -p1 <0001-Add-support-for-loading-prebuilt-ddp-and-ac4-decoder-lib.patch
patch -p1 <0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
patch -p1 <0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0004-Import-Dolby-Effects-initialization.patch
cd ../..

echo 'Adding Gms patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Gms/0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Gms/0002-Remove-read-device-config-checks.patch
patch -p1 <0001-SettingsProvider-Resolve-google-gms-configurator-denials.patch
patch -p1 <0002-Remove-read-device-config-checks.patch
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

echo 'delete vendorsetup.sh from device tree once this is done'
