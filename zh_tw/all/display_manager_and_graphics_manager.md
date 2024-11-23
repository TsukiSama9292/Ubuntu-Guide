# 顯示管理器與圖形管理器
預設的顯示管理器為 `gdm` , 圖形管理器為 `gnome`  
個人推薦使用 `lightdm` 搭配 `xfce4` 使用  
記憶體佔用較少, 額且快捷鍵放視窗很快
## 更換步驟
1. 安裝 `lightdm` 與 `xfce4`
```bash
sudo apt update && sudo apt upgrade -y && sudo apt install lightdm -y
```
跳出終端機顯示紫色的畫面 , 接著按下 `Enter` 鍵 , 使用 `方向建(下)` , 選擇 `lightdm` 作為顯示管理器

2. 安裝 `xfce4`
```bash
sudo apt update && sudo apt install xfce4 -y
```
3. 推薦安裝 - 擷屏工具 和 藍芽工具
```bash
sudo apt update
sudo apt install xfce4-screenshooter blueman -y
```
擷屏工具快捷鍵為 `PrintScreen`  
4. 重起電腦
```bash
sudo reboot
```
5. 登入界面 , 點擊橘色內的按鈕 , 選擇 `xfce` 作為桌面環境即可
![image](/assets/lightdm.png)