# 移除和清除軟體
## 移除安裝
package_name 為軟體包名稱 , 例如 `docker` , 如果要一次行移除相關套件可以寫 `docker*`
```bash
sudo apt purge <package_name>
```
## 清理系統中可能殘留的損壞依賴和不必要的軟體包
```bash
sudo apt autoremove --purge
sudo apt clean
sudo dpkg --configure -a
sudo apt install -f
``