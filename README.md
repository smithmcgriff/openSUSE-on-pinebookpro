# openSUSE-on-pinebookpro

This image contains a base install of openSUSE tumbleweed with Xfce. I've tried both KDE and Xfce, and Xfce is the clear winner here. I'd estimate it runs about 50% faster than KDE. 

grab the image here:

https://sourceforge.net/projects/opensuse-on-pinebookpro/files/Rel_1/

Instructions:
(If you're familiar with suse, you probably won't need the bulk of these instructions)
You must have more than 16G of space to write this image! Preferably 32G or larger

To write image to sdcard from a linux pc:

# xzcat opensuse-tumbleweed-pinebookpro-xfce-1.0.img.xz | dd bs=4M of=/dev/mmcblkX iflag=fullblock oflag=direct status=progress; sync

-------------------------------------------------------------------------------------------------------------------------------

Because of the level of compression I used, writing this image to internal disk from pinebookpro via an os running on a sdcard to internal memory requires you 

# unxz --threads=(max number of threads your pc processor has) -9e opensuse-tumbleweed-pinebookpro-xfce-1.0.img.xz

from a linux pc, then you can copy the disk image to the os running on pinebookpro via sdcard and enter:

# dd if=opensuse-tumbleweed-pinebookpro-xfce-1.0.img of=/dev/mmcblkX oflag=sync status=progress bs=32M

---------------------------------------------------------------------------------------------------------------------------

once you've booted up, username is root, password is linux. Then enter:

# cfdisk /dev/mmcblkX

resize your last partition to use the rest of the free space, make sure to select write in cfdisk before you exit.
then enter:

# resize2fs /dev/mmcblkXp6

You can change root password with the passwd command, then add your own username with:

# useradd -m -G wheel,users,audio,video,trusted -s /bin/bash yourusername

# passwd yourusername

Then:

# systemctl set-default graphical.target && systemctl isolate graphical.target

Lightdm should pop up!

Then, open a terminal and type:

# sudo rcnetwork restart

# sudo systemctl daemon-reload

# sudo hostnamectl set-hostname "yourhostnamehere"

and connect to your wifi network. After that, open YaST Date and Time to update your time settings and you should be all set!

----------------------------------------------------------------------------------------------------------------------------



I'll be creating and adding kernel rpm's up here somewhat frequently. This image contains the latest kernel from the pinebook pro gitlab page. This image is also equipped with apparmor as well.

I got partitioning scheme from Daniel Thomsons debian installation script, so thank's Daniel! Anyway, there are some things I'd like to get working that I haven't been able to, such as grub intergration with u-boot and a btrfs filesystem (couldn't get it to boot). If anyone has any ideas, please let me know!

This distro has great promise for pinebook pro. You can grab source rpm's from software.opensuse.org, and build packages that aren't currently being distributed for the aarch64 format, so the sky is the limit. I'd highly recommend installing rpm devel, kernel devel, and C++ devel for this reason. That can be achieved with one command: 

# sudo zypper in -t pattern devel_rpm_build devel_C_C++ devel_kernel 

That will grab what you need to start building source rpm's.

One caveat with opensuse is it does not ship with media codecs needed for watching/playing videos in web browsers. On the x86_64 platform you can easily grab them from the Packman repo, but they seem to have a small selection of aarch64 and noarch rpm's. I'm going to try to hunt down the needed ones/build from source, but if you're a huge youtube watcher, this probably is not the distro for you at this time. 
# UPDATE: 
I was able to solve this issue with a bit of a workaround. Chromium for debian is now running in a systemd-nspawn container, so youtube and other media formats work as expected! All you need to do is open chromium in your applications as you normally would! The password for chromium is your root password.
# UPDATE 2:
Thanks to the Manjaro guys the sleep function now works. I'm adding a script above that I've (shamefully) "borrowed" from them. Again, all credit goes to them. Just copy and paste the script or download it somewhere, run 'chmod +x sleep-fix.sh', and type 'sudo sh sleep-fix.sh'. Also, to get a better lockscreen, I'd recommend running:

# sudo zypper rm xscreensaver
# sudo zypper in xfce4-screensaver

Have a lot of fun...
