# Run steam apps with nvidia optimus

Path for rc files at 2 line

```
prime-offload
optimus-manager --switch hybrid

# for run game on videocard
# __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME="nvidia" __VK_LAYER_NV_optimus="NVIDIA_only" %command%
```

# Connect to Wi-Fi on Linux only with console

```
nmcli radio wifi on
nmcli dev status
nmcli dev wifi list
sudo nmcli dev wifi connect Spot password 'mypassword'
nmcli con show --active
nmcli con sh
sudo nmcli con del <UUID>
nmcli con down <SSID or UUID>
nmcli con up <SSID or UUID>
```

# More symbols in terminal
```
sudo pacman -S noto-fonts-emoji
```

Change volume step default by media keys in xfce from 5 to 3
```
xfconf-query -c xfce4-panel -lv | grep pulseaudio
xfconf-query -c xfce4-panel -p /plugins/plugin-<number>/volume-step --create -t int -s 3
```
