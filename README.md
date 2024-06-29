# Ubuntu 24.04 LTS 小問題與疑難雜症 解法方法
1. [Ubuntu 系統安裝需要注意主機板廠牌](#ubuntu-系統安裝需要注意主機板廠牌)
1. [Ubuntu 只使用一個USB灌Ubuntu(適用Windows) 解決方法](#ubuntu-只使用一個usb灌ubuntu適用windows-解決方法)
1. [Ubuntu Nvidia 顯卡驅動模組錯誤 解決方法](#ubuntu-nvidia-driver-模組正確安裝指南最人性化作法)  
2. [Ubuntu 重新分配磁碟分區 免重灌方法(也適用Windows)](#重新分配系統磁碟分區(不需要重灌))  
3. [Ubuntu 渲染問題 暫時無法解決](#ubuntu-可能無法解決的渲染視窗問題)  
4. [Ubuntu 最方便的安裝軟體安裝包 解決方法](#ubuntu-最方便的安裝軟體安裝包方法)  
5. [Ubuntu CPU , RAM , Nvidia GPU 使用率顯示 解決方法](#ubuntu-cpu--ram--nvidia-gpu-顯示)  
6. [Ubuntu 開啟windows的Steam遊戲 解決方法](#ubuntu-開-windows-的-steam-軟體遊戲-解決方法)  
7. [Ubuntu Steam 開啟軟體或遊戲時，發生錯誤 解決方法](#ubuntu-官方-steam-執行軟體遊戲-發生錯誤通常是某個資料夾不見)  
8. [Ubuntu 麥克風無法正常運作 解決方法](#ubuntu-麥克風無法正常運作)  
9. [Ubuntu 麥克風雜訊過多 解決方法](#ubuntu-麥克風雜訊過多)  

# Ubuntu 系統安裝需要注意主機板廠牌
盡量選擇有Ubuntu官方認證的主機板執行Ubuntu系統安裝，如: 技嘉(Gigabyte) , 華碩(ASUS)  
目前已知微星(msi)主機板非常不適合使用Ubuntu和其他Linux發行版  
開機的時候會無法正常顯示BIOS和作業系統  

# Ubuntu 只使用一個USB灌Ubuntu(適用Windows) 解決方法
## 事前準備 : 
1. windows 10 PC  x 1
2. Linxu PC x 1 (可改成 windows 10 磁碟分割工具)
3. USB硬碟 1TB (>50GB)，記得先保存重要檔案
4. windows 下載 Ubuntu 官方iso
5. windows 安裝 Rufus
6. 目標電腦
```
1. 盡量選有Ubuntu認證過的主機板廠牌並且確保BIOS版本不要過低。
2. 原本沒有任何系統的電腦也可以照著本文安裝
```
## 流程：
1. windows插入USB
2. 開啟Rufus，顯示進階，顯示USB，把iso灌進USB中(整個USB會變成Ubuntu USB Live開機USB)
3. 開始以磁碟分割工具，Ubuntu叫做硬碟，將完整的Ubuntu USB Live進行磁碟分割，保留10GB左右(極限7GB)，其他的變成空的空間
```
此磁碟分區不會在後續安裝時被格式化，不會是系統根目錄或家目錄，而是掛載在media目錄中而已，所以視情況配空間就好，不見得要很小或很大，如果想要做硬碟加密保護資料，可以多配一點點。
```
4. 將USB插到想要灌系統的電腦上，進入BIOS(加載BIOS畫面中按下F9~F12其一)
5. 修改BIOS開機優先序，改成USB(直接看廠牌、型號名)
6. 保存並退出BIOS設定
7. 開始初始化Ubuntu安裝環境中...
8. 跳出選擇介面Try install Ubuntu(掛機也會自動選這個)
9. 進入Ubuntu，更新一下Ubuntu安裝，重啟Ubuntu安裝
10. 開始互動式安裝Ubuntu
11. 選擇完整安裝、給系統安裝顯卡,多媒體Player
12. **選擇手動分割磁碟**，除了原本的10GB預留的空間，其他的硬碟都改成空的空間，設定開機硬碟為USB，即：產生Boot的根，可以考慮開給它2GB(預設1GB多也可以)，視情況分配硬碟。
```
1. 如果電腦只有ubuntu這個系統的話，記得只開ext4，如果是想要雙系統不要照著本文設定。  
2. 如果是大量開發專案的需求，如Docker，或想要安裝大量軟體， '/' 根目錄，可以開多一點，，我直接佔滿剩下的USB空間，我設定M.2 SSD 200GB，為/home 家目錄。
```
13. 建立帳號，然後自動安裝。
14. 安裝完，重啟電腦。
15. 打開ubuntu硬碟，把直接10GB的磁碟區格式化，可以自行利用這個空間，我直接改成加密磁碟區。

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

# 重新分配系統磁碟分區(不需要重灌)
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
由於linux適用的軟體安裝包副檔名(拓展名)非常多樣  
若使用GDM的話，最方便安裝軟體的方法  
即是原生GDM工具『Software』  
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

# Ubuntu 開 Windows 的 Steam 軟體/遊戲 解決方法
1. 左上角設定 -> 相容性 -> 為所有產品啟動 Steam Play -> 執行其他產品時使用: Proton Experimental -> 重啟Steam
2. 隨便下載一個軟體/遊戲 -> 取消下載 -> 改成下載Steam Linux Runtime 3.0(sniper) -> 再下載Proton Experimental -> 重啟
3. 下載想要的軟體/遊戲 -> 收藏庫 -> 右鍵軟體/遊戲 -> 內容 -> 相容性 -> 強制使用特定 Steam Play 相容性工具(打勾) -> 選擇 Proton Experimental -> 啟動軟體/遊戲

# Ubuntu 官方 steam 執行軟體/遊戲 發生錯誤(通常是某個資料夾不見)
收藏庫 -> 右鍵軟體 -> 內容 -> 一般 -> 啟動選動  
Library -> Right click software -> Properties -> Geraral -> launch options
```
-force-d3d9
```
重啟遊戲，即可

# Ubuntu 麥克風無法正常運作
開啟AlsaMixer，關閉 Auto-Mute Mode
```
alsamixer
```
1. 按下 F6 -> 選擇 HDA Intel PCH
2. 按下右方向鍵，找到Auto-Mute Mode，Disabled
有可能沒有直接生效，重啟就好
```
sudo reboot
```

# Ubuntu 麥克風雜訊過多
由於有些麥克風老舊或是低階，會導致麥克風會有大量的底噪  
Windows擁有的Realtek驅動可以開啟雜訊抑制  
但是linux沒有Realtek這樣官方支援  
我個人建議使用pactl新增PulseAudio的消除回音模組  
由於麥克風還是很吵的話  
開OBS把Echo-Cancel Source設定雜訊消除並且監聽到VirtualSink  
這時候VirtualMic就會有消除回音模組+OBS設定  
## 編輯開機sh檔案
如果沒有資料夾路徑，可以自行建立一個
```
sudo nano /etc/profile.d/load_echo_cancel.sh
```
## load_echo_cancel.sh的內容
```
#!/bin/bash
echo "Script executed by USER=$USER and XDG_SESSION_TYPE=$XDG_SESSION_TYPE"
if [ "$USER" = "tuskisama" ] && [ "$XDG_SESSION_TYPE" = "x11" ]; then
        echo "Executing pactl load-module commands..."
        pactl load-module module-echo-cancel
        pactl load-module module-null-sink sink_name=VirtualSink sink_propertie>
        pactl load-module module-remap-source master=VirtualSink.monitor source>
fi
```
## 賦予權限
```
sudo chmod +x /etc/profile.d/load_echo_cancel.sh
sudo reboot
```
## 重開機後
```
pactl list short modules | grep echo-cancel
```
輸出(類似)
```
536870913	module-echo-cancel		
536870916	module-echo-cancel
```
