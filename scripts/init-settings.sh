#!/bin/bash

# Set default theme to luci-theme-argon
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci

# 获取最新版本号
LATEST_VERSION=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
# 下载压缩包
curl -LO https://github.com/XTLS/Xray-core/releases/download/v$LATEST_VERSION/Xray-linux-arm64-v8a.zip
# 解压缩压缩包
unzip Xray-linux-arm64-v8a.zip
# 移动 xray 文件到 /usr/bin 目录
mv xray /usr/bin/
# 删除解压后的目录（假设解压后目录名为 Xray-linux-arm64-v8a）
rm -rf Xray-linux-arm64-v8a
# 清理下载的压缩包
rm Xray-linux-arm64-v8a.zip


# Disable IPV6 ula prefix
# sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

exit 0
