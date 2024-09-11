# 2. 安裝Ubuntu系統到USB
## 事前準備 : 
1. Windows / Linux
2. USB 3.0/3.1/3.2 `16GB以上`
3. 下載 Ubuntu 官方 iso(推薦使用最新LTS上個LTS版本 , 例如: 24.04 LTS 最新 , 就使用 22.04 LTS)
4. Windows 安裝 [Rufus](https://rufus.ie/zh_TW/) / Linux 安裝 [Balena Etcher](https://www.balena.io/etcher/)
5. 目標裝置
## 流程：
1. 原本的主機插 USB
2. Rufus/Balena , 選擇iso檔案 , 按下執行( 清除USB檔案與分區 ) , USB 會變成 `Ubuntu USB Live` 
3. 啟動`磁碟分割工具` , USB`壓縮`到約10GB的空間(`Ubuntu USB Live` 會自動移動到10GB的空間)
4. 將 USB 插到想要灌系統的電腦上 , 進入 `BIOS` (加載`BIOS`畫面中按下`F2~F12`,`del`其一)
5. 針對不同`BIOS`廠商 , 修改開機磁碟優先序 , 並且`關閉快速啟動(有的主機板沒有)`和`關閉安全啟動`
6. 保存並退出`BIOS`設定
7. 開始初始化Ubuntu安裝環境中...
8. 跳出選擇介面`Try install Ubuntu`
9. 進入 Ubuntu 安裝畫面 , 開始`互動式安裝`Ubuntu , `語言選擇習慣的`
10. 選擇普通安裝 , 安裝第三方驅動 (最省時)
11. 安裝方式選`其他` , 僅選擇壓縮時剩下的`未分配空間` , 全部設定為主系統的`/`目錄 , 開機選擇目錄選擇在`/`目錄的磁碟分區名稱
12. 建立帳號(`建議全部小寫`)
13. 安裝完 , 立即重啟 , **不要拔掉USB , 直接按Enter** 
14. 若有其他系統(Windows) , 會進入選擇系統畫面(`grub`) , 選擇 Ubuntu 開機(不動作也會自動進入)
15. 進入 Ubuntu 系統 , 之前的 `Ubuntu USB Live` 的磁碟分區可以`格式化`(自行運用)
16. 沒有問題的話 , 推薦接著做 [硬體/設備篇 - 顯示管理器與圖形管理器](./display_manager_and_graphics_manager.md)
# 3. 僅一個硬碟安裝 Windows / Ubuntu 雙系統
## 事前準備
1. 與 安裝Ubuntu系統到USB 相同
## 流程
1. 安裝Ubuntu系統到USB 的 1~2 步驟  
2. 建議開始清除硬碟上的垃圾 , `遊戲` / `Microsoft 365` / `付費軟體` 可以考慮保留 , 多數開發軟體可以考慮移除  
3. 啟動磁碟分割工具 , `硬碟壓縮到極限也可以`(Windows會留安全空間) , 空的不用設定分區
4. 安裝Ubuntu系統到USB 的 4~12 步驟  
5. 安裝完 , 立即重啟 , `拔掉USB` , 再按Enter
6. 會進入選擇系統畫面(`grub`) , 方向鍵"上/下"選擇系統 , 按Enter進入
7. 沒有問題的話 , 推薦接著做 [硬體/設備篇 - 顯示管理器與圖形管理器](./display_manager_and_graphics_manager.md)
