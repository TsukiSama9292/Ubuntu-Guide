# Ubuntu 24.04 LTS Issues and Troubleshooting Solutions by TsukiSama9292(Translated by ChatGPT 3.5)
[開啟繁體中文說明文檔](/Tradionnal%20Chinese/README.md)

1. [Important Considerations for Motherboard Brands when Installing Ubuntu](#1-important-considerations-for-motherboard-brands-when-installing-ubuntu)
2. [Installing Ubuntu Using Only One USB (Applicable to Windows)](#2-installing-ubuntu-using-only-one-usb-applicable-to-windows)
3. [Most User-Friendly Solution for Ubuntu Nvidia Graphics Driver Errors](#3-most-user-friendly-solution-for-ubuntu-nvidia-graphics-driver-errors)
4. [Repartitioning Disks in Ubuntu Without Reinstallation (Applicable to Windows)](#4-repartitioning-disks-in-ubuntu-without-reinstallation-applicable-to-windows)
5. [Rendering and Window Lock Issues in Ubuntu](#5-rendering-and-window-lock-issues-in-ubuntu)
6. [Most Convenient Way to Install Software Packages in Ubuntu](#6-the-easiest-way-to-install-software-packages-on-ubuntu)
7. [Displaying CPU, RAM, and Nvidia GPU Usage in Ubuntu](#7-displaying-cpu-ram-and-nvidia-gpu-usage-in-ubuntu)
8. [Running Windows Steam Games on Ubuntu](#8-how-to-launch-windows-steam-games-on-ubuntu)
9. [Errors or Black Screen When Launching Software or Games on Ubuntu Steam](#9-fixing-errors-or-black-screen-when-launching-software-or-games-on-ubuntu-steam)
10. [Microphone Not Functioning Properly in Ubuntu](#10-fixing-mic-not-working-properly-on-ubuntu)
11. [Excessive Microphone Noise in Ubuntu](#11-too-much-noise-from-mic-on-ubuntu)
12. [Missing Libraries in Ubuntu and apt Cannot Find Them](#12-ubuntu-missing-libraries-and-unable-to-find-with-apt)
13. [Displaying the Dock on All Monitors in Ubuntu](#13-displaying-ubuntu-dock-on-all-monitors)
14. [Setting Up Microphone Loopback Functionality on Ubuntu](#14-setting-up-microphone-loopback-functionality-on-ubuntu)
15. [Unity Hub Cannot Run On Ubuntu](#15-unity-hub-cannot-run-on-ubuntu)

# 1. Important Considerations for Motherboard Brands when Installing Ubuntu
It's recommended to choose motherboards with official Ubuntu certification for installing the Ubuntu system, such as Gigabyte and ASUS. Currently, MSI motherboards are known to be very unsuitable for Ubuntu and other Linux distributions. There may be issues with properly displaying the BIOS and operating system during startup. 

# 2. Installing Ubuntu Using Only One USB (Applicable to Windows)
## Preparation : 
1. Windows 10 PC x 1 (Rufus system requirements, can use other tools to create a bootable USB drive)
2. Linux PC x 1 (can be replaced with Windows 10 disk partitioning tool)
3. USB 3.0 external hard drive N GB (fast speed and large capacity preferred), remember to back up important files
4. Download the official Ubuntu ISO on Windows
5. Install Rufus on Windows
6. Target device(s) x N (some edge computing devices, allowing for screen output can also work)
```
1. Choose a motherboard brand with Ubuntu certification and ensure the BIOS version is not too low
2. Computers without any operating system can also be installed according to this guide
```
## Process :
```
If the computer will only have Ubuntu, remember to use the ext4 file system.
If you want a dual-boot system, do not follow this guide.
```
1. Insert the USB into the Windows PC
2. Open Rufus, show advanced options, display the USB, and write the ISO to the USB (the entire USB will become an Ubuntu USB Live bootable USB)
3. Start the disk partitioning tool, in Ubuntu it's called Disks, partition the entire Ubuntu USB Live, keeping around 10GB (minimum 7GB) and leaving the rest as empty space
```
The 10GB partition will not be formatted during the subsequent installation and will not be the system root or home directory. It will be mounted in the media directory, so allocate space accordingly. It doesn't have to be the minimum or very large. If you want to encrypt the disk to protect data, you can allocate a bit more.
```
4. Insert the USB into the computer where you want to install the system, enter the BIOS (press F9~F12, Del, etc. during the BIOS loading screen)
5. Change the boot disk priority in the BIOS to USB (you'll recognize the Ubuntu USB Live by the brand and model name)
6. Save and exit the BIOS settings
7. Start the Ubuntu installation environment...
8. The interface for selecting Try or Install Ubuntu will appear (it will automatically select this after a timeout)
9. Enter Ubuntu, update the Ubuntu installer, and restart the installation
10. Start the interactive Ubuntu installation
11. **Choose a complete installation**, and install system drivers and multimedia players (you can skip installing the player)
12. Choose manual disk partitioning, besides the reserved 10GB space, allocate the rest of the hard drive as empty space, and set the boot disk to USB, i.e., create the boot root, consider allocating 2GB for it (default is a bit over 1GB), and allocate disk space accordingly
13. Create an account, then the installation will proceed automatically
14. After installation, restart the computer
15. Open the Ubuntu disk, format the 10GB partition, and use this space as you wish. I directly changed it to an encrypted disk partition.

# 3. Most User-Friendly Solution for Ubuntu Nvidia Graphics Driver Errors
## Ubuntu System Installation
1. Follow the standard installation procedure and install the system-provided components to avoid issues.
## Changing the Display Manager on Ubuntu (Optional)
1. Using GNOME Desktop (default, can be ignored)
```
sudo dpkg-reconfigure gdm3 
sudo reboot
```
2. Using Xfce Desktop
### First Time Using Xfce
```
sudo apt update
sudo apt upgrade
sudo apt install xfce4
```
Then, select lightdm as the display manager.
### Restart lightdm Service
```
sudo dpkg-reconfigure lightdm 
sudo reboot
```
## Installing Nvidia Drivers on Ubuntu (strongly recommended to use integrated graphics if available; otherwise, use TTY to enter commands)
1. Open "Software & Updates" and click on "Additional Drivers" (wait for a few seconds).
2. First, set the additional drivers to xserver-xorg-video-nouveau.
3. Restart the computer.
4. Then, set the additional drivers to Nvidia-driver-555 (proprietary).
5. Restart the computer again.
## Final Checks
### Display Manager
```
systemctl status display-manager
```
You should see that either gdm or lightdm is in use.
### Graphics Card Modules
```
lsmod | grep nvidia
```
You should see modules without errors, similar to the following:
```
nvidia_uvm           4943872  0
nvidia_drm            122880  4
nvidia_modeset       1368064  3 nvidia_drm
nvidia              54566912  33 nvidia_uvm,nvidia_modeset
video                  73728  2 i915,nvidia_modeset
```

# 4. Repartitioning Disks in Ubuntu Without Reinstallation (Applicable to Windows)
1. Back Up Important Data (skip if nothing is important)
2. Boot Using Ubuntu LIVE USB
3. Resize and Reallocate Disk Partitions
```
To accurately allocate space:
1. First, use the Disks (native tool) to free up space.
2. Use GParted to move partitions (you can only gain space from the right side).
3. Reopen the Disks tool to allocate the freed-up space (only on the right side of the current partition).
```
## Command to Open GParted
```
sudo gparted
```

# 5. Rendering and Window Lock Issues in Ubuntu
## Special Rendering Methods
Some rendering methods may cause black screen issues. If you encounter problems with Steam software or games, please refer to [Errors or Black Screen When Launching Software or Games on Ubuntu Steam](#9-fixing-errors-or-black-screen-when-launching-software-or-games-on-ubuntu-steam)  
## Window Lock Issues with Steam Software/Games and Other Applications
Cause : 
This issue can occur with multiple monitors, especially when there is integrated graphics, and the software has an automatic placement feature that does not remember previous settings and cannot be adjusted.
### Adjusting Screen Position (Without Changing Primary Display)
Place the Nvidia graphics card's monitor to the far left in the settings because software usually defaults to the leftmost screen. Restart the software to apply the changes.
### Changing the Primary Display (Setting Integrated Graphics as the Primary Display)
Open Ubuntu settings and change the primary display to the monitor connected to the integrated graphics. This will ensure normal operation.

# 6. The Easiest Way to Install Software Packages on Ubuntu
Due to the variety of software package extensions for Linux, the easiest way to install software when using GDM is with the native GDM tool, Software. 
## Reinstalling the GDM Software Tool
```
sudo apt update
sudo apt install gnome-software
```
## Usage Process
1. Download the installation package you want to execute.
2. If you have changed the default installation method, right-click on the software package and select "Open With Software Install" as the default app.
3. Left-click to open (or right-click and choose to open with Software Install).
4. This will redirect you to Software to execute the installation.

# 7. Displaying CPU, RAM, and Nvidia GPU Usage in Ubuntu
## Displaying CPU and RAM Usage in Terminal
```
sudo apt update
sudo apt install htop
```
```
htop
```
##  Displaying CPU and RAM Usage in GUI
```
sudo apt update
sudo apt install gnome-system-monitor
```
```
gnome-system-monitor
```
## Displaying GPU Usage in Terminal (Execute nvidia-smi every second)
```
watch -n 1 nvidia-smi
```
##  Displaying GPU Usage in GUI
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

# 8. How to Launch Windows Steam Games on Ubuntu
1. Navigate to Settings in the top left corner -> Compatibility -> Enable Steam Play for all titles -> Use this for all other products: Proton Experimental -> Restart Steam.
2. Download any software/game (you can cancel the download afterwards) -> Change to download Steam Linux Runtime 3.0 (sniper) -> Download Proton Experimental again -> Restart.
3. Download the desired software/game -> Library -> Right-click on software/game -> Properties -> Compatibility -> Enable Steam Play for specific title (checkmark) -> Choose Proton Experimental -> Launch software/game.

If there are any issues with the game, such as screen flickering, consider switching to a different Proton version as it might resolve the issue.  
Additional Information: In Linux, switching TTY (session) logins to different users may allow for running multiple instances of Steam games. However, for online games, be cautious as they may check MAC addresses. Having only one network interface card on your computer could potentially lead to official blocks or bans.

# 9. Fixing Errors or Black Screen When Launching Software or Games on Ubuntu Steam
Navigate to Library -> Right-click on the software -> Properties -> General -> Launch Options
```
-force-d3d9
```
Restart the game, and it should resolve the issue.

# 10. Fixing Mic Not Working Properly on Ubuntu
Open AlsaMixer and disable Auto-Mute Mode.
```
alsamixer
```
1. Press F6 -> Select HDA Intel PCH.
2. Use the right arrow key to navigate to Auto-Mute Mode and set it to Disabled.
If changes don't take effect immediately, restart your system.
```
sudo reboot
```

# 11. Too Much Noise from Mic on Ubuntu
Due to aging or lower-end microphones, you may experience significant background noise. While Windows Realtek drivers support noise suppression, Linux lacks official Realtek software for noise reduction.

I recommend using pactl to add PulseAudio's echo cancellation module. If the microphone remains noisy, use OBS to add Echo-Cancel Source to the microphone and monitor it with VirtualSink.
## Editing Bootup Script (sh file)
Create a directory path if it doesn't exist.
```
sudo nano /etc/profile.d/load_echo_cancel.sh
```
## Contents of load_echo_cancel.sh
Replace 'username' with your actual username to prevent multiple users from using this script unnecessarily and creating extra virtual sinks and microphones.
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
## Assign Permissions
```
sudo chmod +x /etc/profile.d/load_echo_cancel.sh
sudo reboot
```
## After Reboot
```
pactl list short modules | grep echo-cancel
```
Output (similar):
```
536870913	module-echo-cancel		
536870916	module-echo-cancel
```

# 12. Ubuntu Missing Libraries and Unable to Find with apt
## Understanding Basic Background Knowledge
In general, most Linux software relies on users to install libraries (abbreviated as libs) themselves. This practice makes the software more lightweight as several applications can share the same library, reducing overall disk space usage. However, some software may bind to specific versions of libraries. Since libraries can be removed, using 'apt' to install libraries is not always effective when the required library has been removed.
```
sudo apt install libname1 libname2 ... libnameN
```
## Resolving Such Issues  
Example Software : [Davinci Resolve on Ubuntu 24.04 LTS](https://youtu.be/Y87MFmcy3lc?list=LL)
1. During software installation, you may encounter terminal errors requesting the installation of specific libraries. Using apt resolves most issues, but if the library cannot be found, refer to [Davinci Resolve on Ubuntu 24.04 LTS](https://youtu.be/Y87MFmcy3lc?list=LL)。
2. Use[ Ubuntu Package Search ](https://packages.ubuntu.com/)to find the required library names and versions (for Ubuntu 24.04 LTS, select Distribution: jammy).
3. Copy the required library and modify the open location to achieve the desired fix.


# 13. Displaying Ubuntu Dock on All Monitors
To display the Ubuntu Dock on all monitors, follow these steps to install the Ubuntu GDM extension:
1. Install the Ubuntu GDM extension:
```
sudo apt install gnome-shell-extension-prefs
```
2. Open the Extensions application.  
3. Click on the three dots next to "Ubuntu Dock" and then click on "Settings".  
4. Under "Position and Size", enable "Show on All Displays".

This will ensure that the Ubuntu Dock is visible on all monitors connected to your system.

# 14. Setting Up Microphone Loopback Functionality on Ubuntu
Ubuntu comes pre-installed with this feature by default, so you can skip this step.
```
sudo apt-get update
sudo apt-get install alsa-utils
```
Create ALSA configuration file:
```
nano ~/.asoundrc
```
Add the following content to the file. Adjust the configuration as necessary; currently, the default speaker is set as the monitoring device, and it monitors a virtual speaker.
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
Use arecord to record audio and aplay to play it back in real-time. Press Ctrl + C to stop monitoring.
```
arecord -D VirtualMic -f cd | aplay -
```

# 15. Unity Hub Cannot Run On Ubuntu
Click to open Unity Hub and wait for a long time with no response.  
The simplest and most direct method is to disable all application restrictions.
```
sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
```
Restart Unity Hub, and it should run successfully.