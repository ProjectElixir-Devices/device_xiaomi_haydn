rm -rf kernel/xiaomi/haydn
git clone --depth=1 https://github.com/PixelExperience-Devices/kernel_xiaomi_haydn kernel/xiaomi/haydn

rm -rf vendor/xiaomi/haydn
git clone --depth=1 https://github.com/ProjectElixir-Devices/vendor_xiaomi_haydn vendor/xiaomi/haydn

rm -rf vendor/xiaomi/haydn-miuicamera
git clone --depth=1 https://gitlab.pixelexperience.org/android/vendor-blobs/vendor_xiaomi_haydn-miuicamera -b twelve vendor/xiaomi/haydn-miuicamera

rm -rf vendor/xiaomi/haydn-firmware
git clone --depth=1 https://gitlab.pixelexperience.org/android/vendor-blobs/vendor_xiaomi_haydn-firmware vendor/xiaomi/haydn-firmware
