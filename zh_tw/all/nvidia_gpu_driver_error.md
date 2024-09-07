# Nvidia GPU 驅動錯誤
## 檢查是否有問題
```
lsmod | grep nvidia
```
### 沒有問題大概會輸出這樣
```
nvidia_uvm           4943872  0
nvidia_drm            122880  4
nvidia_modeset       1368064  3 nvidia_drm
nvidia              54566912  33 nvidia_uvm,nvidia_modeset
video                  73728  2 i915,nvidia_modeset
```
### 有錯誤顯示 , 先嘗試以下步驟
1. 開啟軟體與更新 , 點擊額外驅動程式（等待數秒）
2. 先把額外驅動程式設定在xserver-xorg-video-nouveau(開源)
3. 重啟電腦
4. 再設定驅動為Nvidia-driver-535/540/545/555/560(專有)
5. 重啟電腦
## 再次檢查
```
lsmod | grep nvidia
```
### 沒有問題大概會輸出這樣
```
nvidia_uvm           4943872  0
nvidia_drm            122880  4
nvidia_modeset       1368064  3 nvidia_drm
nvidia              54566912  33 nvidia_uvm,nvidia_modeset
video                  73728  2 i915,nvidia_modeset
```