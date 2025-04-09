#!/bin/bash

mkdir -p files/root
pushd files/root

# Clone oh-my-zsh repository
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions

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

# Get .zshrc dotfile
cp $GITHUB_WORKSPACE/scripts/.zshrc .

popd
