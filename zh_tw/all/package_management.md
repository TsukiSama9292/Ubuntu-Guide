# 指令介紹(套件管理)
## 套件管理差異介紹
- apt : Ubuntu 官方套件管理 , 會主動下載相依性套件
- dpkg : 常見於網站中 , 主動下載的軟體 , 不會主動下載相依性套件
- snap : 由 apt 安裝(Ubuntu 普通安裝有自動安裝) , 推薦使用CLI(終端機命令), 主要使用沙盒環境執行 , 會主動下載相依性套件
- flatpak : 由 apt 安裝(手動安裝) , 推薦使用CLI(終端機命令), 主要使用沙盒環境執行 , 會主動下載相依性套件
## apt 套件(安裝檔案主要從Ubuntu官方取得)
### 更新套件列表
```bash
sudo apt update
```
### 更新套件
```bash
sudo apt upgrade
```
### 搜尋可安裝套件
```bash
sudo apt search <套件名稱>
```
### 安裝套件
```bash
sudo apt install <套件名稱>
```
### 列出安裝過的套件
```bash
sudo apt list --installed
```
### 移除套件
```bash
sudo apt remove <套件名稱>
```
### 移除套件並清除相關配置文件
```bash
sudo apt purge <套件名稱>
```
### 清除緩存文件
```bash
sudo apt clean
```
### 清除過時的套件包
```bash
sudo apt autoremove
```
## dpkg 套件安裝(常見於網站中, 主動下載的軟體)
### 安裝套件(更新其實就是重安裝)
```bash
sudo dpkg -i <套件名稱>
```
### 列出安裝過的套件
```bash
sudo dpkg -l
```
### 列出安裝過的套件 加入過濾文字
```bash
sudo dpkg -l | grep <套件名稱>
```
### 移除套件
```bash
sudo dpkg -r <套件名稱>
```
### 移除套件並清除相關配置文件
```bash
sudo dpkg -P <套件名稱>
```
### 清除 dpkg 中的 apt 依賴套件
```bash
for pkg in <套件名稱>; do sudo apt-get remove $pkg; done
```
## snap 套件安裝(本人比較少使用)
### 更新套件
```bash
sudo snap refresh
```
### 搜尋套件
```bash
sudo snap search <套件名稱>
```
### 安裝套件
```bash
sudo snap install <套件名稱>
```
### 列出安裝過的套件
```bash
sudo snap list
```
### 移除套件
```bash
sudo snap remove <套件名稱>
```
## flatpak 套件安裝(本人比較少使用)
### 更新套件
```bash
sudo flatpak update
```
### 搜尋套件
```bash
sudo flatpak search <套件名稱>
```
### 安裝套件
```bash
sudo snap install <套件名稱>
```
### 列出安裝過的套件
```bash
sudo flatpak list
```
### 移除套件
```bash
sudo snap remove <套件名稱>
```
## 可以額外參考的資料
- [套件管理](https://chusiang.gitbooks.io/working-on-gnu-linux/content/04.package-management.html)