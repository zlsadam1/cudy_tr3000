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

# 自定义函数
addFeeds(){
  if [ $# == 2 ];then
    echo src-git $1 $2 >> feeds.conf.default
  fi
}

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default


addFeeds custom https://github.com/kenzok8/openwrt-packages.git
addFeeds small https://github.com/kenzok8/small.git
