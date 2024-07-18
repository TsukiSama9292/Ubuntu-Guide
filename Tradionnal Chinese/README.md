# Ubuntu 24.04 LTS 問題和故障排除解決方案 by TsukiSama9292
[Open the English instruction document](/README.md)

1. [Ubuntu 系統安裝需要注意主機板廠牌](#1-ubuntu-系統安裝需要注意主機板廠牌)
2. [Ubuntu 只使用一個USB灌Ubuntu(適用Windows)](#2-ubuntu-只使用一個usb灌ubuntu適用windows)
3. [Ubuntu Nvidia 顯卡驅動模組錯誤 最人性化解決方法](#3-ubuntu-nvidia-顯卡驅動模組錯誤-最人性化解決方法)  
4. [Ubuntu 重新分配磁碟分區 免重灌方法(適用Windows)](#4-ubuntu-重新分配磁碟分區-免重灌方法適用windows)  
5. [Ubuntu 渲染與視窗鎖定問題](#5-ubuntu-渲染與視窗鎖定問題)  
6. [Ubuntu 最方便的安裝軟體安裝包的方法](#6-ubuntu-最方便的安裝軟體安裝包的方法)  
7. [Ubuntu CPU , RAM , Nvidia GPU 使用率 顯示方法](#7-ubuntu-cpu--ram--nvidia-gpu-使用率-顯示方法)  
8. [Ubuntu 開啟 Windows 的 Steam 遊戲方法](#8-ubuntu-開啟-windows-的-steam-遊戲方法)  
9. [Ubuntu Steam 開啟軟體或遊戲 錯誤或黑屏](#9-ubuntu-steam-開啟軟體或遊戲-錯誤或黑屏)  
10. [Ubuntu 麥克風無法正常運作](#10-ubuntu-麥克風無法正常運作)  
11. [Ubuntu 麥克風雜訊過多](#11-ubuntu-麥克風雜訊過多)  
12. [Ubuntu 缺失 Library 同時 apt 無法找到](#12-ubuntu-缺失-library-同時-apt-無法找到)
13. [Ubuntu 所有螢幕都要顯示快捷工作列( Dock )](#13-ubuntu-所有螢幕都要顯示快捷工作列-dock-)
14. [Ubuntu 設定麥克風耳返功能](#14-ubuntu-設定麥克風耳返功能)
15. [Ubuntu Unity Hub 無法運行](#15-ubuntu-unity-hub-無法運行)
16. [Ubuntu 複製使用者配置](#16-ubuntu-複製使用者配置)
17. [Ubuntu 無門檻的同時雙開使用者與多開相同遊戲解決方法](#17-ubuntu-無門檻的同時雙開使用者與多開相同遊戲解決方法)
18. [好用工具推薦 - 下載YT影片或音檔](/Tradionnal%20Chinese/Download_Youtube_Video_OR_Audio_Author_TsukiSama9292.ipynb)

# 1. Ubuntu 系統安裝需要注意主機板廠牌
盡量選擇有Ubuntu官方認證的主機板執行Ubuntu系統安裝，如: 技嘉(Gigabyte) , 華碩(ASUS)  
目前已知微星(MSI)主機板非常不適合使用Ubuntu和其他Linux發行版  
開機的時候很可能會無法正常顯示BIOS和作業系統  

# 2. Ubuntu 只使用一個USB灌Ubuntu(適用Windows)
## 事前準備 : 
1. Windows 10 PC x 1 (Rufus的系統需求，可以換成別的工具製作開機USB硬碟)
2. Linxu PC x 1 (可改成 windows 10 磁碟分割工具)
3. USB 3.0 外接硬碟 N GB(速度快容量大較好)，記得先保存重要檔案
4. Windows 下載 Ubuntu 官方iso
5. Windows 安裝 Rufus
6. 目標設備 x N 台(一些邊緣運算裝置，允許螢幕輸出也可以這樣做)
```
1. 盡量選有Ubuntu認證過的主機板廠牌並且確保BIOS版本不要過低
2. 原本沒有任何系統的電腦也可以照著本文安裝
```
## 流程：
```
如果電腦只有ubuntu這個系統的話，記得用成ext4檔案系統
但如果是想要雙系統不要照著本文設定  
```
1. Windows插入USB
2. 開啟Rufus，顯示進階，顯示USB，把iso灌進USB中(整個USB會變成Ubuntu USB Live開機USB)
3. 開始以磁碟分割工具，Ubuntu叫做硬碟，將完整的Ubuntu USB Live進行磁碟分割，保留10GB左右(極限7GB)，其他的變成空的空間
```
保留10GB的磁碟分區不會在後續安裝時被格式化，也不會是系統根目錄或家目錄，而是掛載在media目錄中而已，所以視情況配空間就好，不見得要極限值或很大，如果想要做硬碟加密保護資料，可以多配一點點
```
4. 將USB插到想要灌系統的電腦上，進入BIOS(加載BIOS畫面中按下F9~F12,del其一)
5. 修改BIOS開機磁碟優先序，改成USB(直接對廠牌、型號名就知道哪個是Ubuntu USB LIVE)
6. 保存並退出BIOS設定
7. 開始初始化Ubuntu安裝環境中...
8. 跳出選擇介面Try install Ubuntu(掛機也會自動選這個)
9. 進入Ubuntu，更新一下Ubuntu安裝，重啟Ubuntu安裝
10. 開始互動式安裝Ubuntu
11. 選擇完整安裝、給系統安裝顯卡,多媒體Player(播放器可以不安裝)
12. **選擇手動分割磁碟**，除了原本的10GB預留的空間，其他的硬碟都改成空的空間，設定開機硬碟為USB，即：產生Boot的根，可以考慮開給它2GB(預設1GB多也可以)，視情況分配硬碟。
13. 建立帳號，然後自動安裝。
14. 安裝完，重啟電腦。
15. 打開ubuntu硬碟，把直接10GB的磁碟區格式化，可以自行利用這個空間，我直接改成加密磁碟區。

# 3. Ubuntu Nvidia 顯卡驅動模組錯誤 最人性化解決方法
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
sudo apt install xfce4
```
然後選擇lightdm作為顯示管理器
### 之前有安裝過Xfce4，想要重啟lightdm服務
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

# 4. Ubuntu 重新分配磁碟分區 免重灌方法(適用Windows)
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

# 5. Ubuntu 渲染與視窗鎖定問題
## 渲染方式特別
有一些渲染方式，比較特別可能會黑屏的情況  
如果是steam的軟體或遊戲，請參考 [Ubuntu Steam 開啟軟體或遊戲 錯誤或黑屏](#9-ubuntu-steam-開啟軟體或遊戲-錯誤或黑屏)  
## Steam軟體/遊戲與其他應用程式 視窗鎖定問題
發生原因 : 
多螢幕且有內顯，且軟體有自動放到某個顯示器的功能(無上次記憶)，並且無法調整設定修改
### 修改螢幕位置(無須修改主要顯示器)
把Nvidia顯示卡的螢幕放在設定的最左邊，因為軟體都是抓最左邊的螢幕(通常)，重啟軟體即可
### 修改主要顯示器(把主要顯示器改成內顯)
打開Ubuntu設定，把顯示器設定改成內顯的螢幕，這樣絕對可以正常使用

# 6. Ubuntu 最方便的安裝軟體安裝包的方法
由於Linux適用的軟體安裝包副檔名(拓展名)非常多樣  
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

# 7. Ubuntu CPU , RAM , Nvidia GPU 使用率 顯示方法
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

# 8. Ubuntu 開啟 Windows 的 Steam 遊戲方法
1. 左上角設定 -> 相容性 -> 為所有產品啟動 Steam Play -> 執行其他產品時使用: Proton Experimental -> 重啟Steam
2. 隨便下載一個軟體/遊戲 -> 取消下載 -> 改成下載Steam Linux Runtime 3.0(sniper) -> 再下載Proton Experimental -> 重啟
3. 下載想要的軟體/遊戲 -> 收藏庫 -> 右鍵軟體/遊戲 -> 內容 -> 相容性 -> 強制使用特定 Steam Play 相容性工具(打勾) -> 選擇 Proton Experimental -> 啟動軟體/遊戲

遊戲如果有異常現象，如:畫面閃爍的情況，可以考慮換一個Proton版本，說不定可以解決。  
補充知識 : 其實Linux切換TTY(session)登入到數個不同的使用者，可能可以做到Steam遊戲多開，但請注意連網遊戲可能會檢查Mac Address，只有一個網路介面卡的電腦，很可能被官方擋住或Ban掉。

# 9. Ubuntu Steam 開啟軟體或遊戲 錯誤或黑屏
收藏庫 -> 右鍵軟體 -> 內容 -> 一般 -> 啟動選動  
Library -> Right click software -> Properties -> Geraral -> launch options
```
-force-d3d9
```
重啟遊戲，即可

# 10. Ubuntu 麥克風無法正常運作
開啟 AlsaMixer，關閉 Auto-Mute Mode
```
alsamixer
```
1. 按下 F6 -> 選擇 HDA Intel PCH
2. 按下右方向鍵，找到 Auto-Mute Mode，Disabled
有可能沒有直接生效，重啟就好
```
sudo reboot
```

# 11. Ubuntu 麥克風雜訊過多
由於有些麥克風老舊或是低階，會導致麥克風會有大量的底噪  
Windows 擁有的 Realtek 驅動可以開啟雜訊抑制  
但是 Linux 沒有 Realtek 官方軟體支援降造  
我個人建議使用 pactl 新增 PulseAudio 的消除回音模組  
如果麥克風還是很吵的話  
開 OBS 把 Echo-Cancel Source 麥克風 新增 雜訊消除 並且 用 VirtualSink 監聽  
這時候 VirtualMic 就會有消除回音模組 + OBS 設定  
## 編輯開機sh檔案
如果沒有資料夾路徑，可以自行建立一個
```
sudo nano /etc/profile.d/load_echo_cancel.sh
```
## load_echo_cancel.sh的內容
底下由一個username改成你開機的使用者名稱  
這樣才不會有多個使用者都使用這個腳本的情況  
避免開多餘的虛擬喇叭和麥克風  
```
#!/bin/bash
echo "Script executed by USER=$USER and XDG_SESSION_TYPE=$XDG_SESSION_TYPE"
if [ "$USER" = "username" ] && [ "$XDG_SESSION_TYPE" = "x11" ]; then
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

# 12. Ubuntu 缺失 Library 同時 apt 無法找到
## 了解基礎背景知識
基本上，絕大多數的 Linux 軟體會依賴使用者自行安裝 Linux 的 Library(簡稱：lib)  
這讓多數軟體自身更加輕量(因為數個軟體共用 lib，所以佔用的空間變更少)  
但是，有些軟體會綁定特定版本的 lib  
由於 lib 有可能被移除，使用 apt 安裝 lib 並不是萬能的，不能獲取已經移除的 lib  
```
sudo apt install lib名稱1 lib名稱2 ... lib名稱N
```
## 以下講解如何解決此類問題  
範例軟體 : [Davinci Resolve on Ubuntu 24.04 LTS](參考影片:https://youtu.be/Y87MFmcy3lc?list=LL)
1. 當安裝軟體時，可能會看到終端機跳出錯誤，要求使用者安裝指定的 lib。使用 apt 可以解決大部分問題，但找不到 lib 時，請參考 [Davinci Resolve on Ubuntu 24.04 LTS](https://youtu.be/Y87MFmcy3lc?list=LL)。
2. 透過在[Ubuntu 套件搜尋](https://packages.ubuntu.com/)，找需要的 lib 名稱與版本（Ubuntu 24.04 LTS 選擇 Distribution: jammy）。
3. 透過複製 lib 與修改開啟位置，達到修復的效果。


# 13. Ubuntu 所有螢幕都要顯示快捷工作列( Dock )
1. 安裝 Ubuntu GDM 擴充套件
```
sudo apt install gnome-shell-extension-prefs
```
2. 開啟 擴充套件 程式  
3. 點擊 Ubuntu Dock 的三個點再按下設定  
4. 位置與大小 -> Dock 顯示於 所有螢幕(打勾)
Ubuntu Dock 將在系統上連接的所有顯示器上都能見到。

# 14. Ubuntu 設定麥克風耳返功能
Ubuntu已有預設安裝，可略過。
```
sudo apt-get update
sudo apt-get install alsa-utils
```
創建 ALSA 配置文件
```
nano ~/.asoundrc
```
文件中添加類似以下內容，視情況調整配置，目前是預設喇叭為監聽設備，監聽的是虛擬喇吧。
```
pcm.!default {
    type pulse
    fallback "sysdefault"
    hint {
        show on
        description "Default ALSA Output (currently PulseAudio Sound Server)"
    }
}

ctl.!default {
    type pulse
    fallback "sysdefault"
}

pcm.VirtualMic {
    type pulse
    device "VirtualMic"
}
```
使用 arecord 來錄製音頻並通過 aplay 即時播放，按下 Ctrl + C 關閉監聽
```
arecord -D VirtualMic -f cd | aplay -
```

# 15. Ubuntu Unity Hub 無法運行
點擊開啟Unity Hub 等待許久都沒有反應  
最簡單暴力的作法，停用所有應用程式的限制  
關閉 AppArmor 對無特權使用者命名空間  
```
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```
重啟Unity Hub，即可運行
建議不要直接寫在啟動執行裡面  
這個操作可能導致系統有安全疑慮  

# 16. Ubuntu 複製使用者配置
這可以執行複製桌面環境，但是複製到steam設定可能會壞掉，因為steam是使用容器建立的，少複製東西就可能會害steam無法正常開啟，所以有steam的話不建議。
```
sudo cp -r /home/olduser/.config /home/newuser/
sudo cp -r /home/olduser/.local /home/newuser/
```
更新新使用者的權限
```
sudo chown -R newuser:newuser /home/newuser/.config
sudo chown -R newuser:newuser /home/newuser/.local
```

# 17. Ubuntu 無門檻的同時雙開使用者與多開相同遊戲解決方法
## 用途說明
比較普通的用途是可以快速開一個具有GUI的使用者在背景中，並且可以被任何裝置遠端控制。  
但對於遊戲玩家可以有特殊的用途，如:
1. 如果說今天你想要在一台電腦上，快速且簡單有效的多開2個相同的電腦遊戲，這個方法將會很適合你，此流程通常不到5分鐘就結束。  
2. 如果說你有特別想要快速且簡單的多開2個以上相同的Steam遊戲，那這個方法簡直是為你量身訂做的，Ubuntu可以下載安裝的Steam來源很多 :  [steam official](https://store.steampowered.com/about/) , [Flatpak steam](https://ivonblog.com/posts/install-steam-flatpak-on-linux/) , App center (開啟速度非常慢，需要開很多相同再考慮安裝)，理論上加上遠端背景執行可以開6個相同遊戲。
## 前置工作
1. 必須要有兩個Ubuntu使用者(之後要登入被控制的使用者要強制關閉遠端session)
2. 必須有一個 Google 帳號
## 使用Chrome-remote-desktop SSH登入
1. 在要被控制使用者透過[Chrome遠端桌面](https://remotedesktop.google.com/access/)，授權SSH登入，幾本上就照著官方說明流程。
2. 重啟電腦
3. 打開另一個使用者，透過[Chrome遠端桌面](https://remotedesktop.google.com/access/)控制正在背景執行的session。

# 18. 
可以下載任何在 YouTube 上的『影片(w)』或『音檔』  
本工具特色
1. 支援 完整播放清單 / 一個影音連結 下載
2. 支援 選擇『影片解析度』，最高到『8K/60fps』也可以，若畫質不存在，會自動選擇影片最高解析度
3. 具備使用者界面，可以像是操作網頁一個使用本工具，介面上可以即時監看下載狀態
4. 支援 Windows/macOS/Linux...主流作業系統，Colab也可以直接運行