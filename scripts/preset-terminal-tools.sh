#!/bin/bash

mkdir -p files/root
pushd files/root

# Clone oh-my-zsh repository
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions

# Get .zshrc dotfile
cp $GITHUB_WORKSPACE/scripts/.zshrc .

popd


mkdir -p files/usr/bin
pushd files/usr/bin

# 获取最新版本号
LATEST_VERSION=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
# 下载压缩包
curl -LO https://github.com/XTLS/Xray-core/releases/download/v$LATEST_VERSION/Xray-linux-arm64-v8a.zip

# 解压缩压缩包到指定目录
unzip Xray-linux-arm64-v8a.zip -d Xray-linux-arm64-v8a

# 移动 xray 文件到 /usr/bin 目录
mv Xray-linux-arm64-v8a/xray .

ls ./
# 删除解压后的目录（假设解压后目录名为 Xray-linux-arm64-v8a）
rm -rf Xray-linux-arm64-v8a
# 清理下载的压缩包
rm Xray-linux-arm64-v8a.zip

popd


# log
echo -e "ls -lh files"
ls -lh files
echo ""

echo -e "ls -lh files/etc"
ls -lh files/etc
echo ""

echo -e "ls -lh files/root"
ls -lh files/root/
echo ""

echo -e "ls -lh files/root/.oh-my-zsh"
ls -lh files/root/.oh-my-zsh
echo ""

echo -e "ls -lh files/usr"
ls -lh files/usr/
echo ""

echo -e "ls -lh files/usr/bin"
ls -lh files/usr/bin/
echo ""
