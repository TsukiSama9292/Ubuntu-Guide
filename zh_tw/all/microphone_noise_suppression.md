# Ubuntu 麥克風雜訊抑制
## 備份配置文檔(避免意外)
```bash
sudo cp /etc/pulse/default.pa /etc/pulse/default.pa.bak
```
## 編輯配置文檔
```bash
sudo nano /etc/pulse/default.pa
```
## 在文件末尾添加以下行
```bash
load-module module-echo-cancel aec_method=webrtc source_name=echoCancel_source sink_name=echoCancel_sink
set-default-source echoCancel_source
set-default-sink echoCancel_sink
```
## 重啟電腦
```bash
sudo reboot
```