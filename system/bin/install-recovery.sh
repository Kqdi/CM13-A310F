#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 16433152 d5ef989b6624467f98e1c4085f42cdb2a68fa174 13891584 498121c7cf3ccd4d1c85e50dd8e8c2f03370078a
fi

if ! applypatch -c EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:16433152:d5ef989b6624467f98e1c4085f42cdb2a68fa174; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:13891584:498121c7cf3ccd4d1c85e50dd8e8c2f03370078a EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY d5ef989b6624467f98e1c4085f42cdb2a68fa174 16433152 498121c7cf3ccd4d1c85e50dd8e8c2f03370078a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
