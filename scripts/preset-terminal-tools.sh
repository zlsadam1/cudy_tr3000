#!/bin/bash

mkdir -p files/root
pushd files/root

# Clone oh-my-zsh repository
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh ./.oh-my-zsh

# Install extra plugins
#git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
#git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
#git clone --depth=1 https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions

rm -rf ./.oh-my-zsh/.git

# Get .zshrc dotfile
cp $GITHUB_WORKSPACE/scripts/.zshrc .

popd



# Slider switch wifi off on 


mkdir -p files/etc/rc.button
pushd files/etc/rc.button

touch mode
chmod +x mode

cat << 'EOF' >> mode
#!/bin/sh

# 按键事件参数
BUTTON=${BUTTON:-"mode"}  # 按键名称
ACTION=${ACTION:-"pressed"} # 动作（pressed 或 released）
SEEN=${SEEN:-0}            # 按下时间（秒）

logger "Button $BUTTON was $ACTION for $SEEN seconds"

# 定义滑块开关功能
case "$ACTION" in
    pressed)
        # 滑块开关打开（例如启用 Wi-Fi）
        logger "Slider switch turned ON - Enabling Wi-Fi"
        wifi up
        # 点亮白色 LED（表示状态）
        echo 1 > /sys/class/leds/led-1/brightness
        ;;
    released)
        # 滑块开关关闭（例如禁用 Wi-Fi）
        logger "Slider switch turned OFF - Disabling Wi-Fi"
        wifi down
        # 关闭白色 LED
        echo 0 > /sys/class/leds/led-1/brightness
        ;;
esac
EOF

echo "cat mode "
cat mode

popd
