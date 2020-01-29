# openSUSE-on-pinebookpro

This image contains a base install of openSUSE tumbleweed with Xfce. I've tried both KDE and Xfce, and Xfce is the clear winner here. I'd estimate it runs about 50% faster than KDE. 

Instructions:
(If you're familiar with suse, you probably won't need the bulk of these instructions)

To write image to disk:
# unxz opensuse-tumbleweed-pinebookpro-xfce.img.xz

# dd bs=4M if=opensuse-tumbleweed-pinebookpro-xfce.img of=/dev/yourdiskname iflag=fullblock,direct oflag=direct status=progress

----------------------------------------------------------------------------------------------------------------------------


The system is going to launch directly into a console. Log in with user=root, password=linux. Then just add a username with a command such as "useradd -m -G wheel,trusted,audio,video,users -s /bin/bash yourusername". After that, just enter "passwd yourusername" to change the password and "passwd root" if you'd like to change the root password as well. Then, you can just enter "systemctl set-default graphical.target && systemctl isolate graphical.target" and lightdm should pop up. This image boots very slowly when flashed to the internal eMMC, I'm not exactly sure why, so just give it a couple of minutes and it will boot. It's a bit faster from sdcard after it's initial first boot. After you're logged in, I'd strongly recommend entering "sudo zypper inr" (short for install-new-recommends) into a terminal. It'll grab the rest of the packages you need, about 600 or so. This is an extremely minimal intallation image.

I'll be creating and adding kernel rpm's up here somewhat frequently. This image contains the latest kernel from the pinebook pro gitlab page. This image is also equipped with apparmor as well.

I got partitioning scheme from Daniel Thomsons debian installation script, so thank's Daniel! Anyway, there are some things I'd like to get working that I haven't been able to, such as grub intergration with u-boot and a btrfs filesystem (couldn't get it to boot). If anyone has any ideas, please let me know!

This distro has great promise for pinebook pro. You can grab source rpm's from software.opensuse.org, and build packages that aren't currently being distributed for the aarch64 format, so the sky is the limit. I'd highly recommend installing rpm devel, kernel devel, and C++ devel for this reason. That can be achieved with one command: "sudo zypper in -t pattern devel_rpm devel_C_C++ devel_kernel". That will grab what you need to start building source rpm's.

One caveat with opensuse is it does not ship with media codecs needed for watching/playing videos in web browsers. On the x86_64 platform you can easily grab them from the Packman repo, but they seem to have a small selection of aarch64 and noarch rpm's. I'm going to try to hunt down the needed ones/build from source, but if you're a huge youtube watcher, this probably is not the distro for you at this time.

Have a lot of fun...
