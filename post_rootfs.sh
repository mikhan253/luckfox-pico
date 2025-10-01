#!/bin/sh
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Post-processing root filesystem at $1"
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

rmdir $1/var/lib/iwd
ln -s /run/wifi_config $1/var/lib/iwd
rm -f $1/etc/dropbear
ln -s /mnt/userdata/config/ssh $1/etc/dropbear
rm $1/etc/os-release
rm $1/usr/lib/os-release
rm $1/lib32
rm $1/usr/lib32

for service in $1/etc/sv/*; do
    [ -d "$service" ] || continue
    svc_name=$(basename "$service")
    ln -s "/run/${svc_name}_supervise" "$service/supervise"
done