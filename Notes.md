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
