# 顯示管理器與圖形管理器
預設的顯示管理器為 `gdm` , 圖形管理器為 `gnome`  
但強烈推薦使用 `lightdm` 搭配 `xfce4` 使用
## 更換步驟
1. 安裝 `lightdm` 與 `xfce4`
```bash
sudo apt update && sudo apt upgrade -y && sudo apt install lightdm -y
```
```bash
# 跳出終端機顯示紫色的畫面 , 接著按下 `Enter` 鍵 , 使用 `方向建(下)` , 選擇 `lightdm` 作為顯示管理器
```
2. 安裝 `xfce4`
```bash
sudo apt update && sudo apt install xfce4 -y
```
3. 重起電腦
```bash
sudo reboot
```