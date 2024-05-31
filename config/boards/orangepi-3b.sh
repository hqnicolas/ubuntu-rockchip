# shellcheck shell=bash

export BOARD_NAME="H96 Max Rk3566"
export BOARD_MAKER="Hqnicolas"
export UBOOT_PACKAGE="u-boot-turing-rk3588"
export UBOOT_RULES_TARGET="orangepi-3b-rk3566"

function config_image_hook__orangepi-3b() {
    local rootfs="$1"
    local overlay="$2"

    # Enable bluetooth
    cp "${overlay}/usr/bin/hciattach_opi" "${rootfs}/usr/bin/hciattach_opi"
    cp "${overlay}/usr/lib/systemd/system/sprd-bluetooth.service" "${rootfs}/usr/lib/systemd/system/sprd-bluetooth.service"
    chroot "${rootfs}" systemctl enable sprd-bluetooth

    return 0
}
