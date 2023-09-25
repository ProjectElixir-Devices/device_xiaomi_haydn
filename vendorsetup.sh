echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning Common device tree'
rm -rf device/xiaomi/sm8350-common
git clone --depth=1 https://github.com/ProjectElixir-Devices/device_xiaomi_sm8350-common -b haydn device/xiaomi/sm8350-common

# Kernel
echo 'Cloning Kernel tree'
rm -rf kernel/xiaomi/sm8350
git clone --depth=1 https://github.com/INCENDIOCODM/android_kernel_xiaomi_sm8350 -b Elixir-13 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning Vendor tree'
rm -rf vendor/xiaomi/haydn
git clone --depth=1 https://github.com/INCENDIOCODM/proprietary_vendor_xiaomi_haydn -b lineage-20 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning Common vendor tree'
rm -rf vendor/xiaomi/sm8350-common
git clone --depth=1 https://github.com/INCENDIOCODM/proprietary_vendor_xiaomi_sm8350-common -b lineage-20 vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning Firmware'
rm -rf vendor/xiaomi/haydn-firmware
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Xiaomi
echo 'Cloning Hardware xiaomi'
rm -rf hardware/xiaomi
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi

# Camera
echo 'Cloning Leica camera'
rm -rf vendor/xiaomi/haydn-miuicamera
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b thirteen-leica vendor/xiaomi/haydn-miuicamera

echo 'delete vendorsetup.sh from device tree once this is done'
