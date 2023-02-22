#!/system/bin/sh


if /system/bin/grep -Fq twrpfastboot /proc/cmdline; then

    if [[ -b /dev/block/bootdevice/by-name/system ]]
    then
    mkdir /mnt/system
    mount -o ro /dev/block/bootdevice/by-name/system /mnt/system
    cat /mnt/system/system/etc/selinux/plat_file_contexts > /tmp/file_contexts
    cat /mnt/system/system/etc/selinux/plat_file_contexts > /plat_file_contexts
    umount /mnt/system
    fi

    if [[ -b /dev/block/bootdevice/by-name/vendor ]]
    then
    mkdir /mnt/vendor
    mount -o ro /dev/block/bootdevice/by-name/vendor /mnt/vendor
    cat /mnt/vendor/etc/selinux/vendor_file_contexts >> /tmp/file_contexts
    cat /mnt/vendor/etc/selinux/vendor_file_contexts > /vendor_file_contexts
    umount /mnt/vendor
    fi

    if [[ -b /dev/block/bootdevice/by-name/product ]]
    then
    mkdir /mnt/product
    mount -o ro /dev/block/bootdevice/by-name/product /mnt/product
    cat /mnt/product/etc/selinux/product_file_contexts >> /tmp/file_contexts
    cat /mnt/product/etc/selinux/product_file_contexts > /product_file_contexts
    umount /mnt/product
    fi

    if [[ -b /dev/block/bootdevice/by-name/odm ]]
    then
    mkdir /mnt/odm
    mount -o ro /dev/block/bootdevice/by-name/odm /mnt/odm
    cat /mnt/odm/etc/selinux/odm_file_contexts >> /tmp/file_contexts
    cat /mnt/odm/etc/selinux/odm_file_contexts > /odm_file_contexts
    umount /mnt/odm
    fi

    if [[ -b /dev/block/bootdevice/by-name/system_ext ]]
    then
    mkdir /mnt/system_ext
    mount -o ro /dev/block/bootdevice/by-name/system_ext /mnt/system_ext
    cat /mnt/system_ext/etc/selinux/system_ext_file_contexts >> /tmp/file_contexts
    cat /mnt/system_ext/etc/selinux/system_ext_file_contexts > /system_ext_file_contexts
    umount /mnt/system_ext
    fi

    cp /tmp/file_contexts /file_contexts
fi
