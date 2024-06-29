# Ubuntu Nvidia Driver 模組正確安裝指南(最人性化作法)
## Ubuntu系統安裝
1. 基本上照著常規流程，盡量安裝系統提供的東西，省得麻煩
## Ubuntu改圖顯驅動（可選）
1. 主要用GNOME桌面，這是預設值，可以忽略
```
sudo dpkg-reconfigure gdm3 
sudo reboot
```
2. 主要用Xfce桌面
### 首次使用Xfce
```
sudo apt update
sudo apt upgrade
sudo apt install xfce4
```
然後選擇lightdm作為顯示管理器
### 重啟lightdm服務
```
sudo dpkg-reconfigure lightdm 
sudo reboot
```
## Ubuntu Nvidia Driver 安裝（強烈建議使用核顯操作，沒有核顯，只能使用TTY打指令）
1. 開啟軟體與更新，點擊額外驅動程式（等待數秒）
2. 先把額外驅動程式設定在xserver-xorg-video-nouveau
3. 重啟電腦
4. 再把額外驅動程式設定在Nvidia-driver-555(專有)
5. 重啟電腦
## 最終檢查
### 顯示管理器
```
systemctl status display-manager
```
會看到是使用gdm或lightdm
### 顯示卡模組
```
lsmod | grep nvidia
```
會看到沒有Error的模組
大概會像是
```
nvidia_uvm           4943872  0
nvidia_drm            122880  4
nvidia_modeset       1368064  3 nvidia_drm
nvidia              54566912  33 nvidia_uvm,nvidia_modeset
video                  73728  2 i915,nvidia_modeset
```

# 不重灌並且重新分配系統磁碟分區
1. 備份重要資料(都不重要就略過)
2. 透過Ubuntu LIVE USB開機
3. 重新磁碟分區大小並且移動配置
```
為了達到準確配置空間大小。
1. 先透過硬碟(原生軟體)釋放空間。
2. 透過gparted移動磁碟分區(獲取空間只能獲取右側的)
3. 重新開啟硬碟(原生軟體)，獲取釋放出來的空間(僅當前磁碟右側)
```
## 開啟gparted的指令
```
sudo gparted
```

# Ubuntu 可能無法解決的渲染、視窗問題
1. 有一些渲染方式，很可能僅適合在windows上執行，即便是最新版的驅動也無法渲染。
2. 有些應用程式會自動抓取內顯與第一個顯示器，若有滑鼠限制在視窗內的設定，移動視窗很可能不會移動限制視窗範圍，導致完全移動到另一個螢幕會超出點擊範圍。

# Ubuntu 最方便的安裝軟體安裝包方法
由於linux適用的軟體安裝包副檔名(拓展名)非常多樣，若使用GDM的話，最方便安裝軟體的方法，即是原生GDM工具『Software』。
## 重新安裝GDM工具包
```
sudo apt update
sudo apt install gnome-software
```
## 使用流程
1. 下載想要執行的安裝包
2. 若有更動過預設安裝方法，右鍵點擊軟體安裝包，選擇『安裝軟體』為Default App
3. 滑鼠左鍵雙擊開啟(或是右鍵 使用安裝軟體開啟)
4. 跳至『軟體』執行安裝

# Ubuntu CPU , RAM , Nvidia GPU 顯示 
## CPU , RAM 顯示終端機
```
sudo apt update
sudo apt install htop
```
```
htop
```
##  CPU , RAM 顯示GUI
```
sudo apt update
sudo apt install gnome-system-monitor
```
```
gnome-system-monitor
```
## GPU 顯示終端機，每秒執行 nvidia-smi 在終端機顯示
```
watch -n 1 nvidia-smi
```
##  GPU 顯示GUI
```
sudo apt install git qtdeclarative5-dev cmake
git clone https://github.com/congard/nvidia-system-monitor-qt
cd nvidia-system-monitor-qt
sudo install icon.png /usr/share/icons/hicolor/512x512/apps/nvidia-system-monitor-qt.png
mkdir build
cmake -DCMAKE_BUILD_TYPE=Release -DIconPath=/usr/share/icons/hicolor/512x512/apps/nvidia-system-monitor-qt.png -B build -G "Unix Makefiles"
cmake --build build --target qnvsm -- -j 4
sudo install build/qnvsm /usr/local/bin
```
```
qnvsm
```

# Ubuntu 官方 steam 執行軟體/遊戲 發生錯誤(通常是某個資料夾不見)
收藏庫 -> 右鍵軟體 -> 屬性 -> 一般 -> 啟動選動
Library -> Right click software -> Properties -> Geraral -> launch options
```
-force-d3d9
```