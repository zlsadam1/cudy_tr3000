# CUDY TR3000 V1 114M OpenWrt

# Version 
```text
  CUDY_TR3000_V1_114M_APK    :  snapshot latest
  CUDY_TR3000_V1_114M_OP_24_10_4:  tag v24.10.4
```

# Config
Config Buildinfo here: [config.buildinfo](https://github.com/nova-boop/cudy_tr3000/releases/download/CUDY_TR3000_V1_114M_APK/config.buildinfo)
Config config here: [openwrt-tr3000.config](https://raw.githubusercontent.com/nova-boop/cudy_tr3000/refs/heads/main/OpenWrt-OPKG-TR3000.config)

# Enable Slider switch
```text
  "Slider Function Key Custom Configuration"
  shell: /usr/bin/handle-keys.sh
```

# Plug -in
```text
luci-proto-ipv6
luci-proto-wireguard
luci-proto-relay
luci-app-ddns
luci-app-diskman
luci-app-samba4
luci-app-filemanager
luci-app-hd-idle
luci-app-poweroff
luci-app-autoreboot
luci-app-adguardhome
luci-app-https-dns-proxy
luci-app-ttyd
luci-app-pushbot
luci-app-oaf
luci-app-socat
luci-app-nft-qos
luci-app-wol
luci-app-upnp
luci-app-uhttpd
luci-app-wifischedule
luci-app-onliner
luci-app-wrtbwmon
luci-app-turboacc
luci-app-xxxxwall
luci-app-temp-status
luci-app-usb-printer
luci-theme-argon
```

# Actions-OpenWrt

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/Qs315490/RedMi-AC2100-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/Qs315490/RedMi-AC2100-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/Qs315490/RedMi-AC2100-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

Build OpenWrt using GitHub Actions

[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)


## info

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Acknowledgments

- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/Qs315490/RedMi-AC2100-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)
