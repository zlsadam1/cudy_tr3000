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

BUTTON=${BUTTON:-"mode"}
ACTION=${ACTION:-"pressed"}
SEEN=${SEEN:-0}

logger "Button $BUTTON was $ACTION for $SEEN seconds"

case "$ACTION" in
    pressed)
        logger "Slider switch turned ON - Enabling Wi-Fi"
        wifi up
        echo 1 > /sys/class/leds/led-1/brightness
        ;;
    released)
        logger "Slider switch turned OFF - Disabling Wi-Fi"
        wifi down
        echo 0 > /sys/class/leds/led-1/brightness
        ;;
esac
EOF

popd
