#!/bin/sh
#
#blddist -- Version: 1 -- by Prharsha(https://github.com/gsvprharsha)
#
#Step by Step Live-Build
#
# ~/home/legion/Desktop/new -- build folder
# ~/home/legion/Desktop/first -- prep files location
#
# Phase 1: Assign WKDIR variable the output of pwd
#
WKDIR="$(pwd)"
#
#
# Phase 2: Create the build staging folder
#
mkdir pheonix
#
cd pheonix
#
#
# Phase 3: Set up build environment
#
lb config --binary-images iso-hybrid --mode debian --architecture amd64 --linux-flavours amd64 --distribution stretch --archive-areas "main contrib non-free" --updates true --security true --cache true --apt-recommends true --debian-installer live --debian-installer-gui false --win32-loader false --iso-application pheonixOS --iso-preparer Prharsha --iso-publisher Prharsha
#
#
# Phase 4: Install desktop and applications
#
echo task-xfce-desktop > $WKDIR/pheonix/config/package-lists/desktop.list.chroot
#
#
echo havegd yad less gdebi galculator grsync psensor gparted bleachbit flac faad faac mjpegtools x265 x264 ffmpeg streamripper sox mencoder dvdauthor twolame lame asunder aisleriot filezilla openshot vlc winff mpv soundconverter hplip-hui cdrdao frei0r-plugins htop jfsutils xfsprogs ntfs-3g mtools gthumb testdisk partimage numix-gtk-theme albatross-gtk-theme blackbird-gtk-theme greybird-gtk-theme xorriso p7zip-full p7zip-rar keepassx hardinfo inxi gnome-disk-utility simplescreenrecorder vokoscreen chromium simple-scan thunderbird arc-theme gstreamer1.0-plugins-bad lightdm-gtk-greeter-settings gnome-system-tools dos2unix dialog faenza-icon-theme liferea transmission-gtk handbrake handbrake-cli audacity python-glade2 rar unrar ssh cifs-utils gvfs-backends gvfs-bin pciutils squashfs-tools syslinux syslinux-common dosfstools isolinux live-build fakeroot linux-headers-amd64 lsb-release menu gksu build-essential dkms curl wget apt-transport-https dirmngr nvidia-detect openvpn network-manager-openvpn openvpn-systemd-resolved libqt5opengl5 > $WKDIR/pheonix/config/package-lists/packages.list.chroot
#
#
# Phase 5: Copy files into chroot
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/usr/share/pheonix/prep
#
#
cp $WKDIR/prep1 $WKDIR/pheonix/config/includes.chroot/usr/share/pheonix/prep1
#
cp -r $WKDIR/prep1/bootloaders $WKDIR/pheonix/config/bootloaders
#
#
cp $WKDIR/prep1/misc64/* $WKDIR/pheonixconfig/packages.chroot/
#
#
mkdir -p $WKDIR/pheonix/config/hooks/normal
#
cp $WKDIR/prep1/hooks/* $WKDIR/pheonix/config/hooks/normal/
#
#
cp $WKDIR/prep1/vbox64/* $WKDIR/pheonix/config/packages.chroot
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/etc/skel/.config
#
cp -r $WKDIR/prep1/xfce4 $WKDIR/pheonix/config/includes.chroot/etc/skel/.config/xfce4
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/usr/share/images/desktop.base
#
cp $WKDIR/prep1/backgrounds/* $WKDIR/pheonixincludes.chroot/usr/share/images/desktop-base/
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/usr/share/icons/default
#
cp $WKDIR/prep1/icons/* $WKDIR/pheonix/config/includes.chroot/usr/share/icons/default
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/usr/local/bin
#
cp $WKDIR/prep1/scripts/* $WKDIR/pheonix/config/includes.chroot/usr/local/bin/
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/usr/share/doc/pheonix
#
cp $WKDIR/prep1/doc/* $WKDIR/pheonix/config/includes.chroot/usr/share/doc/pheonix/
#
#
mkdir -p $WKDIR/pheonix/config/includes.chroot/etc/skel/Desktop
#
ln -s /usr/share/doc/pheonix $WKDIR/pheonix/config/includes.chroot/etc/skel/Desktop/
#
#
# Phase 6: Start the build process
#
lb build
#
#
# Phase - 7: (CHROOT): Wait for the build to complete. The ISO will be inside the build folder.
#
# --------- End of the live build process -----------
