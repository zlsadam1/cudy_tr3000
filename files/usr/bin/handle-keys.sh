#!/bin/sh

# 定义要监听的事件文件和按键代码
EVENT_FILE="/dev/input/event0"
KEY_CODE="373"
KEY_NAME="KEY_MODE"

# 确保脚本以守护进程方式运行（通常通过 /etc/init.d 启动）
# 如果您是通过后台运行，请确保它在后台运行
echo "开始监听 $EVENT_FILE 中的 $KEY_NAME ($KEY_CODE) 事件..."

while true; do
    # 使用 evtest 持续监听 event1
    evtest "$EVENT_FILE" | while read line; do
        
        # 1. 检查是否为 KEY_MODE (373) 事件 (type 1)
        if echo "$line" | grep -q "type 1 (EV_KEY), code $KEY_CODE ($KEY_NAME)"; then
            
            # 2. 检查 value 状态
            if echo "$line" | grep -q "value 1"; then
                # value 1: 视为 ON 状态，启用 Wi-Fi
                echo "Slider switch turned ON - Enabling Wi-Fi"
                logger -t key_handler "Slider switch ON: wifi up"
                wifi up 

            elif echo "$line" | grep -q "value 0"; then
                # value 0: 视为 OFF 状态，禁用 Wi-Fi
                echo "Slider switch turned OFF - Disabling Wi-Fi"
                logger -t key_handler "Slider switch OFF: wifi down"
                wifi down

            fi
        fi
    done
done
