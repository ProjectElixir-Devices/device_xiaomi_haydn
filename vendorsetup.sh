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

# Hardware-Display
rm -rf hardware/qcom-caf/sm8350/display
git clone https://github.com/Evolution-X/hardware_qcom-caf_sm8350_display -b udc hardware/qcom-caf/sm8350/display

echo 'delete vendorsetup.sh from device tree once this is done'
