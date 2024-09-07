# Steam 遊戲與錯誤
1. 到 [Steam](https://store.steampowered.com/about/) 網站 , 下載 Steam.deb
2. 到下載的資料夾 , 安裝 Steam.deb
```bash
sudo dpkg -i <Steam安裝包名稱>.deb
### 顯示缺乏32位元
sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade
sudo apt install steam
### 有顯示缺乏相依性
sudo apt-get update && sudoapt-get install -f
```
3. 啟動 Steam , 登入帳號 , 點擊左上角`Steam` -> `Setting(設定)` -> `Compatlbility(相容性)` -> `Enable Steam Play for supported titles(為支援的遊戲啟用 Steam Play)` -> `Run other titles with(執行其他遊戲時使用)` -> `Proton 7.0-6` -> 重啟Steam
4. 在遊戲的`Store Page(商店頁面)`查看`推薦 DirectX 版本` -> 回到`LIBRARY(收藏庫)` -> 在列表對遊戲名稱按`滑鼠右鍵` -> `Properties(內容)` -> `General(一般)` -> `Launch Options(啟動選項)` -> 輸入以下內容
```
-force-d3d<推薦版本>
### 範例
-force-d3d12
```
5. 安裝僅支援Windows的遊戲 -> `LIBRARY(收藏庫)` -> 在列表對遊戲名稱按`滑鼠右鍵` -> `Properties(內容)` -> `Compatibility(相容性)` -> Force the use of a specific Steam Play compatibility tool(強制使用特定 Steam Play 相容性工具)`打勾` -> 選擇 `Proton 7.0-6` -> `啟動遊戲`