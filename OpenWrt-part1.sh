#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: OpenWrt-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# upgrade gcc11
# sudo apt-get update && sudo apt-get upgrade -y
# sudo apt-get install software-properties-common -y
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
# sudo apt-get update
# sudo apt-get install gcc-11 g++-11 -y
# sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 60 --slave /usr/bin/g++ g++ /usr/bin/g++-11
# sudo update-alternatives --config gcc
# gcc --version

# 自定义函数
addFeeds(){
  if [ $# == 2 ];then
    echo src-git $1 $2 >> feeds.conf.default
  fi
}

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}


# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

addFeeds custom https://github.com/kenzok8/openwrt-packages.git
addFeeds small https://github.com/kenzok8/small.git

# 支持 turboacc
# 不带 shortcut-fe
curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh --no-sfe
# 带  不带 shortcut-fe
# curl -sSL https://raw.githubusercontent.com/chenmozhijin/turboacc/luci/add_turboacc.sh -o add_turboacc.sh && bash add_turboacc.sh
# shortcut-fe
git_sparse_clone package https://github.com/chenmozhijin/turboacc shortcut-fe


# 关机
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
# 应用过滤
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
# 钉钉推送
git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
# 端口转发 A luci app of socat for nftables
git clone --depth=1 https://github.com/WROIATE/luci-app-socat package/luci-app-socat

# 定时重启
git clone https://github.com/zxl78585/luci-app-autoreboot.git package/luci-app-autoreboot
# 磁盘管理
git clone --depth=1 https://github.com/lisaac/luci-app-diskman package/luci-app-diskman
# 温度插件
git clone --depth=1 https://github.com/gSpotx2f/luci-app-temp-status package/luci-app-temp-status

# 带宽监控+在线设备，相互依赖
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-wrtbwmon wrtbwmon luci-app-onliner
# usb打印+网络唤醒Plus
git_sparse_clone main https://github.com/kenzok8/small-package luci-app-usb-printer luci-app-wolplus
# KMS 
# git_sparse_clone main https://github.com/kenzok8/small-package luci-app-vlmcsd vlmcsd

# 1
# git_sparse_clone main https://github.com/kenzok8/small-package vlmcsd
# git clone https://github.com/ssuperh/luci-app-vlmcsd-new.git package/luci-app-vlmcsd

# 2
git_sparse_clone main https://github.com/DokiDuck/luci-app-vlmcsd luci-app-vlmcsd vlmcsd

# 2
# git_sparse_clone main https://github.com/kenzok8/small-package vlmcsd
# git clone https://github.com/AutoCONFIG/luci-app-vlmcsd package/luci-app-vlmcsd


# SMS tools
git_sparse_clone master https://github.com/4IceG/luci-app-sms-tool luci-app-sms-tool sms-tool

# luci-app-airplay2
# git_sparse_clone luci19 https://github.com/tcsr200722/openwrt-luci-app luci-app-airplay2

git_sparse_clone main https://github.com/kenzok8/small-package dns2socks ipt2socks microsocks


# 
./scripts/feeds update -a
# remove 
rm -rf feeds/small/{luci-app-bypass,luci-app-ssr-plus}
