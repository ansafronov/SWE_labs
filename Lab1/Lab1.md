# Lab 1


## Task 1
Using system package manager, install package figlet, run command figlet hello ubuntu, remove package figlet

Answer:
```bash
sudo apt -y install figlet;
figlet hello ubuntu;
sudo apt -y remove figlet;
```

Output:
```console
~/.../SWE_labs (main)$ sudo apt -y install figlet;
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  gconf2 libegl1-mesa libgl1-amber-dri libgl1-mesa-glx libllvm13 libllvm13:i386 libvulkan1:i386 libwayland-client0:i386 libxcb-randr0:i386
  linux-headers-5.17.5-76051705 linux-headers-5.17.5-76051705-generic linux-image-5.17.5-76051705-generic linux-modules-5.17.5-76051705-generic
  mesa-vulkan-drivers:i386 pipewire-audio-client-libraries wireguard wireguard-dkms wireguard-tools
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  figlet
0 upgraded, 1 newly installed, 0 to remove and 625 not upgraded.
Need to get 133 kB of archives.
After this operation, 752 kB of additional disk space will be used.
Get:1 http://apt.pop-os.org/ubuntu jammy/universe amd64 figlet amd64 2.2.5-3 [133 kB]
Fetched 133 kB in 0s (1,250 kB/s)
Selecting previously unselected package figlet.
(Reading database ... 379037 files and directories currently installed.)
Preparing to unpack .../figlet_2.2.5-3_amd64.deb ...
Unpacking figlet (2.2.5-3) ...
Setting up figlet (2.2.5-3) ...
update-alternatives: using /usr/bin/figlet-figlet to provide /usr/bin/figlet (figlet) in auto mode
Processing triggers for man-db (2.10.2-1) ...
~/.../SWE_labs (main)$ figlet hello ubuntu;
 _          _ _               _                 _         
| |__   ___| | | ___    _   _| |__  _   _ _ __ | |_ _   _ 
| '_ \ / _ \ | |/ _ \  | | | | '_ \| | | | '_ \| __| | | |
| | | |  __/ | | (_) | | |_| | |_) | |_| | | | | |_| |_| |
|_| |_|\___|_|_|\___/   \__,_|_.__/ \__,_|_| |_|\__|\__,_|
                                                          
~/.../SWE_labs (main)$ sudo apt -y remove figlet;
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  gconf2 libegl1-mesa libgl1-amber-dri libgl1-mesa-glx libllvm13 libllvm13:i386 libvulkan1:i386 libwayland-client0:i386 libxcb-randr0:i386
  linux-headers-5.17.5-76051705 linux-headers-5.17.5-76051705-generic linux-image-5.17.5-76051705-generic linux-modules-5.17.5-76051705-generic
  mesa-vulkan-drivers:i386 pipewire-audio-client-libraries wireguard wireguard-dkms wireguard-tools
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  figlet
0 upgraded, 0 newly installed, 1 to remove and 625 not upgraded.
After this operation, 752 kB disk space will be freed.
(Reading database ... 379110 files and directories currently installed.)
Removing figlet (2.2.5-3) ...
Processing triggers for man-db (2.10.2-1) ...
```

## Task 2
Create 10 files with template file{number} within one command. Search within the tree for all files that end with a number and delete files from 4-6 files (Don’t Use rm command).

Answer:
```bash
touch file_{1..10}.txt;
find -regex  ".*/.*[4-6].txt" -delete;
```

Output: 
```console 
andro@pop-os ~/.../Lab1 (main)$ ls -l
total 24
-rwxrwxr-x 1 andro andro 3153 Oct 12 10:14 answers.sh
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_10.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_1.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_2.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_3.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_7.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_8.txt
-rw-rw-r-- 1 andro andro    0 Oct 12 10:53 file_9.txt
drwxrwxr-x 5 andro andro 4096 Oct 12 10:14 practical_1_unix_local_machine_1
```

## Task 3
List the contents of your current directory, including the ownership and permissions, and redirect the output to a file called contents.txt within your home directory.

Answer:
```bash
ls -l > contents.txt;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ cat contents.txt 
total 12
-rw-rw-r-- 1 andro andro    0 Oct 12 23:13 contents.txt
-rw-rw-r-- 1 andro andro  222 Oct 12 11:41 Final project.md
drwxrwxr-x 3 andro andro 4096 Oct 12 10:53 Lab1
drwxrwxr-x 2 andro andro 4096 Oct 12 10:15 Lab4
```


## Task 4

Count the number of files called test within the /usr/share directory and its subdirectories. Note: each line output from the find command represents a file.

Answer:
```bash
find /usr/share -name "test" | wc -l;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ find /usr/share -name "test" | wc -l;
3
```

## Task 5
Sort the /etc/passwd file, place the results in a file called foo.txt, and trap any errors in a file called err.txt

Answer:
```bash
sort /etc/passwd > foo.txt 2> err.txt;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ cat foo.txt 
andro:x:1000:1000:andro:/home/andro:/bin/bash
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
avahi-autoipd:x:112:118:Avahi autoip daemon,,,:/var/lib/avahi-autoipd:/usr/sbin/nologin
avahi:x:113:119:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
barval:x:1002:1004:Barbara and Valery,-,-,-,-:/home/barval:/bin/bash
bin:x:2:2:bin:/bin:/usr/sbin/nologin
_chrony:x:126:133:Chrony daemon,,,:/var/lib/chrony:/usr/sbin/nologin
colord:x:107:114:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
cups-pk-helper:x:120:121:user for cups-pk-helper service,,,:/home/cups-pk-helper:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
dnsmasq:x:123:65534:dnsmasq,,,:/var/lib/misc:/usr/sbin/nologin
_flatpak:x:122:130:Flatpak system-wide installation helper,,,:/nonexistent:/usr/sbin/nologin
fwupd-refresh:x:125:132:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
games:x:5:60:games:/usr/games:/usr/sbin/nologin
gdm:x:111:117:Gnome Display Manager:/var/lib/gdm3:/bin/false
geoclue:x:106:112::/var/lib/geoclue:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
gnome-initial-setup:x:108:65534::/run/gnome-initial-setup/:/bin/false
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
nm-openvpn:x:110:116:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
nvidia-persistenced:x:124:131:NVIDIA Persistence Daemon,,,:/nonexistent:/usr/sbin/nologin
openvpn_as:x:1001:1003::/home/openvpn_as:/sbin/nologin
openvpn:x:128:135::/nonexistent:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
rtkit:x:116:125:RealtimeKit,,,:/proc:/usr/sbin/nologin
saned:x:121:128::/var/lib/saned:/usr/sbin/nologin
speech-dispatcher:x:109:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
sshd:x:127:65534::/run/sshd:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
tcpdump:x:115:124::/nonexistent:/usr/sbin/nologin
tss:x:114:123:TPM software stack,,,:/var/lib/tpm:/bin/false
usbmux:x:118:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
uuidd:x:119:127::/run/uuidd:/usr/sbin/nologin
whoopsie:x:117:126::/nonexistent:/bin/false
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
andro@pop-os ~/.../Lab1 (main)$ cat err.txt 
```

## Task 6
Create a directory named Box where all the files are automatically owned by the group users, and can only be deleted by the user who created them.

Answer:
```bash
mkdir -p Box;
chmod g+s Box;
chmod +t Box;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ ls -l | grep "Box"
drwxrwsr-t 2 andro andro 4096 Oct 12 23:17 Box
```

## Task 7
In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at the first depth level (e.g. at practical_1_unix_local_machine_1/ but not deeper)

Answer:
```bash
find practical_1_unix_local_machine_1 -maxdepth 1 -name "*.txt" | wc -l;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ find practical_1_unix_local_machine_1 -maxdepth 1 -name "*.txt" | wc -l;
0
```

## Task 8
In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at any depth level and with the prefix “00221”

Answer:
```bash
find practical_1_unix_local_machine_1 -name "00221*.txt" | wc -l
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ find practical_1_unix_local_machine_1 -name "00221*.txt" | wc -l
13
```

## Task 9
In the provided data practical_1_unix_local_machine_1.zip, count the number of lines in each txt file

Answer:
```bash
for file in $(find practical_1_unix_local_machine_1/ -name "*.txt")
do
    wc -l $file;
done;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ for file in $(find practical_1_unix_local_machine_1/ -name "*.txt")
do
    wc -l $file;
done;
90 practical_1_unix_local_machine_1/4096/00222228_0ca11bb5d8d4ee172802d84c_003__stats.txt
90 practical_1_unix_local_machine_1/4096/00222040_60fb70c2d0d566b3508d9d4f_004/00222040_60fb70c2d0d566b3508d9d4f_004__stats.txt
90 practical_1_unix_local_machine_1/4096/00222413_57576437f76e1bc3976ca308_000__stats.txt
90 practical_1_unix_local_machine_1/4096/00222154_9fec21f45aae56c9022e625f_000__stats.txt
90 practical_1_unix_local_machine_1/4096/00222173_343490fc7ac0a7ec5505c92d_005/00222173_343490fc7ac0a7ec5505c92d_005__stats.txt
90 practical_1_unix_local_machine_1/4096/00222038_60fb70c2d0d566b3508d9d4f_002__stats.txt
90 practical_1_unix_local_machine_1/8192/00221425_7b0c6827c5c1bd442ddfc23c_011__stats.txt
90 practical_1_unix_local_machine_1/8192/00220226_b79b40ef8721383269a6542c_000__stats.txt
90 practical_1_unix_local_machine_1/8192/00221459_ce3275b91ab34c2dafd5da66_022__stats.txt
90 practical_1_unix_local_machine_1/8192/00221410_0a7e21b0760b39c09a373428_000__stats.txt
90 practical_1_unix_local_machine_1/8192/00221910_fa32a7d1af74d41100997dd0_004__stats.txt
90 practical_1_unix_local_machine_1/8192/the_rest/00221501_ce3275b91ab34c2dafd5da66_064/00221501_ce3275b91ab34c2dafd5da66_064__stats.txt
90 practical_1_unix_local_machine_1/8192/the_rest/00221684_e630ec60d4d5148a45ac0fa0_000/00221684_e630ec60d4d5148a45ac0fa0_000__stats.txt
90 practical_1_unix_local_machine_1/8192/00221909_fa32a7d1af74d41100997dd0_003__stats.txt
90 practical_1_unix_local_machine_1/8192/00221960_be1332983e6a04a7ac3a5d0e_004__stats.txt
90 practical_1_unix_local_machine_1/8192/00220340_65e929ab1fef8cf7f1d9a9d2_000__stats.txt
90 practical_1_unix_local_machine_1/8192/00220230_b79b40ef8721383269a6542c_004__stats.txt
90 practical_1_unix_local_machine_1/16384/00221684_e630ec60d4d5148a45ac0fa0_000__stats.txt
90 practical_1_unix_local_machine_1/16384/00221961_be1332983e6a04a7ac3a5d0e_005__stats.txt
90 practical_1_unix_local_machine_1/16384/00221501_ce3275b91ab34c2dafd5da66_064__stats.txt
90 practical_1_unix_local_machine_1/16384/00222000_57b7ac86e4b08c5528961f00_001__stats.txt
90 practical_1_unix_local_machine_1/16384/00221909_fa32a7d1af74d41100997dd0_003__stats.txt
90 practical_1_unix_local_machine_1/16384/00221960_be1332983e6a04a7ac3a5d0e_004__stats.txt
```


## Task 10
Calculate the size of each root (/) subdirectory and sort them by size.

Answer:
```bash
sudo du -sh /* | sort -rh
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ sudo du -sh /* | sort -rh
258G    /home
14G     /usr
8.4G    /var
4.3G    /snap
3.1G    /recovery
930M    /boot
259M    /opt
30M     /etc
3.2M    /root
2.8M    /run
152K    /tmp
8.0K    /media
4.0K    /srv
4.0K    /mnt
0       /sys
0       /sbin
0       /proc
0       /libx32
0       /lib64
0       /lib32
0       /lib
0       /dev
0       /bin
```

## Task 11
Calculate the size of all directories located at filesystem root (/) except the /sys and print the results for the largest one.

Answer:
```bash
sudo du -sh --exclude=/sys /* | sort -rh | head -n 1;
```

Output:
```console
andro@pop-os ~/.../Lab1 (main)$ sudo du -sh --exclude=/sys /* | sort -rh | head -n 1;
258G    /home
```

## Task 12
Calculate the size of all directories located at filesystem root (/) except the /sys and excluding zero-sized directories, and print all results.

Answer:
```bash
for dir in /*; do
    if [ "$dir" != "/sys" ]; then
        size=$(sudo du -s "$dir" | awk '{print $1}')
        if [ $size -ne 0 ]; then
            echo -e "$(echo $size | numfmt --to=iec)\t$dir"
        fi
    fi
done;
```

Output:
```console
ansafronov@epdiib4vlokc17miui4g:~$ for dir in /*; do     if [ "$dir" != "/sys" ]; then
        size=$(sudo du -s "$dir" | awk '{print $1}')
        if [ $size -ne 0 ]; then             echo -e "$(echo $size | numfmt --to=iec)\t$dir";         fi;     fi; done;
252K	/boot
5.5K	/etc
32	/home
16	/lost+found
4	/media
4	/mnt
4	/opt
du: cannot access '/proc/1880/task/1880/fd/4': No such file or directory
du: cannot access '/proc/1880/task/1880/fdinfo/4': No such file or directory
du: cannot access '/proc/1880/fd/3': No such file or directory
du: cannot access '/proc/1880/fdinfo/3': No such file or directory
40	/root
1.1K	/run
884K	/snap
4	/srv
68	/tmp
3.0M	/usr
999K	/var
```