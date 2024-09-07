# 15. Ubuntu Unity Hub 無法運行
## 問題描述
點擊開啟Unity Hub 等待許久都沒有反應  
## 解決方法
關閉 AppArmor 對無特權使用者命名空間 (造成安全疑慮) 
```
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```
重啟Unity Hub , 即可運行