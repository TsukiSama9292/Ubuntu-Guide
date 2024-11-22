# Nvidia GPU 驅動
## 桌面版
### 檢查是否有問題
查看驅動 , 同時也可以查看顯示卡型號 , 未安裝請到[安裝推薦驅動](#安裝推薦驅動)
```bash
nvidia-smi
```
有安裝驅動 , 但好像有問題 , 檢查模組
```bash
lsmod | grep nvidia
```
沒問題的狀態 , 大概像是這樣 , 有問題會有報錯
```bash
nvidia_uvm           4943872  0
nvidia_drm            122880  4
nvidia_modeset       1368064  3 nvidia_drm
nvidia              54566912  33 nvidia_uvm,nvidia_modeset
video                  73728  2 i915,nvidia_modeset
```
模組有錯誤顯示 , 先嘗試以下步驟
1. 開啟軟體與更新(桌面軟體) , 點擊額外驅動程式（等待數秒）
2. 先把額外驅動程式設定在xserver-xorg-video-nouveau(開源)
3. 重啟電腦
4. 再設定驅動為Nvidia-driver-535/540/545/555/560(專有)
5. 重啟電腦
6. 再次使用指令檢查 , 若不行的話 , 可以考慮使用[安裝推薦驅動](#安裝推薦驅動)
## 伺服器與桌面通用操作
### 安裝推薦的驅動
```bash
sudo ubuntu-drivers autoinstall
```
安裝結束後重新啟動電腦
```bash
sudo reboot
```
### 檢查
```bash
nvidia-smi
```
```bash
lsmod | grep nvidia
```