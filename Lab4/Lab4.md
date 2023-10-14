# Lab 4

## Part 1

### Task 1 
ssh-keygen:
a. Generate a ed25519 key with 1024 bits and store it to files with new_key_ed25519 prefix
b. Change the passphrase of this key

Answer:
```bash
ssh-keygen -t ed25519 -b 1024 -f ~/.ssh/new_key_ed25519.pub;
ssh-keygen -p -f ~/.ssh/new_key_ed25519.pub;
```

Output
```console
~: ssh-keygen -t ed25519 -b 1024 -f ~/.ssh/new_key_ed25519.pub
Generating public/private ed25519 key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ~/.ssh/new_key_ed25519.pub
Your public key has been saved in ~/.ssh/new_key_ed25519.pub.pub
The key fingerprint is:
SHA256:tVZ+c/x5F2ZW3Ucc0B6xoNdmpKRG7GrTN/3m1yEq7t4 andrey@Andrejs-MacBook-Pro.local
The key's randomart image is:
+--[ED25519 256]--+
|          .. +o=+|
|          ..+ =+=|
|          o+.o.=*|
|         ..=. ooo|
|        S = . +=o|
|         = . =+=+|
|        . . o o.B|
|         ...    B|
|        ++.E   oo|
+----[SHA256]-----+
~: ssh-keygen -p -f ~/.ssh/new_key_ed25519.pub;
Enter old passphrase:
Key has comment 'andrey@Andrejs-MacBook-Pro.local'
Enter new passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved with the new passphrase.
```

### Task 2
ssh-copy-id:
a. Do a dry-run of writing the new ssh key to a remote
b. Run copy id on the remote

Answer:
```bash
ssh-copy-id -n -i ~/.ssh/new_key_ed25519.pub ansafronov@51.250.110.135;
ssh-copy-id -i ~/.ssh/new_key_ed25519.pub ansafronov@51.250.110.135;
```

Output:
```console
SWE_labs(main) ✗: ssh-copy-id -n -i ~/.ssh/new_key_ed25519.pub ansafronov@51.250.110.135
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/Users/andrey/.ssh/new_key_ed25519.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
=-=-=-=-=-=-=-=
Would have added the following key(s):

ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILr+5klPWIuyFmY9cuHkx4FcrEi6hhV+GWMouOobPV6l andrey@Andrejs-MacBook-Pro.local
=-=-=-=-=-=-=-=
SWE_labs(main) ✗: ssh-copy-id -i ~/.ssh/new_key_ed25519.pub ansafronov@51.250.110.135;
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/Users/andrey/.ssh/new_key_ed25519.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 

Number of key(s) added:        1

Now try logging into the machine, with:   "ssh 'ansafronov@51.250.110.135'"
and check to make sure that only the key(s) you wanted were added.
```

## Part 2
### Task 3
Use the nohup program to run a long computation (for example use “sleep 100; echo complete”).
a. Enter the remote CLI and set up a program to write logs to a file
b. Disconnect from the remote server immediately without waiting for the computation to complete, but
not interrupting its work and saving the output and error logs.

Answer:
```bash
ssh ansafronov@51.250.110.135;
nohup bash -c "sleep 100; echo complete" > 2.3.out 2> 2.3.err &;
exit;
cat 2.3.out;
cat 2.3.err;
```

Output:
```console
(base) SWE_labs(main) ✗: ssh ansafronov@51.250.110.135;
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 5.15.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Oct 12 09:09:37 PM UTC 2023

  System load:  0.0                Processes:             131
  Usage of /:   13.4% of 31.40GB   Users logged in:       0
  Memory usage: 20%                IPv4 address for eth0: 10.129.0.18
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Thu Oct 12 21:04:14 2023 from 95.165.95.148
ansafronov@epdiib4vlokc17miui4g:~$ nohup bash -c "sleep 100; echo complete" > 2.3.out 2> 2.3.err &;
[1] 2937
ansafronov@epdiib4vlokc17miui4g:~$ exit
logout
Connection to 51.250.110.135 closed.
(base) SWE_labs(main) ✗: ssh ansafronov@51.250.110.135;
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 5.15.0-86-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Oct 12 09:11:59 PM UTC 2023

  System load:  0.0                Processes:             133
  Usage of /:   13.4% of 31.40GB   Users logged in:       0
  Memory usage: 20%                IPv4 address for eth0: 10.129.0.18
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Thu Oct 12 21:09:37 2023 from 95.165.95.148
ansafronov@epdiib4vlokc17miui4g:~$ cat 2.3.out 
complete
ansafronov@epdiib4vlokc17miui4g:~$ cat 2.3.err
nohup: ignoring input
```

### Task 4
a. Redirect standard output stream to standard error, and echo to standard error stream. You can
choose any program to generate messages, for example ls -lh
b. Now, the more complex task. Write a command that:
    1. displays the output and error streams as is and
    2. redirect them into separate respective files (that means it prints error message to the stderr and to a file, and prints other outputs to stdout and to a file)


Answer:
```bash
# a
ls -lh 1>&2;
# b
exec 3>&1; ls -lh 2> >(cat >&2 > 2.4.b.err) 1> >(cat > 2.4.b.out >&3); exec 3>&-; 
cat 2.4.b.err 2.4.b.out;
# c

# d
ls -lh 2> >(tee 2.4.d.err >&2) | tee 2.4.d.out;
cat 2.4.d.err 2.4.d.out;
```

Output:
```console
Lab4(main) ✗: ls -lh 1>&2;
total 16
-rw-r--r--  1 andrey  staff   6.6K Oct 13 00:37 Lab4.md
-rw-r--r--  1 andrey  staff     0B Oct 12 23:52 answers.sh
Lab4(main) ✗: exec 3>&1; ls -lh 2> >(cat >&2 > 2.4.b.err) 1> >(cat > 2.4.b.out >&3); exec 3>&-; 
cat 2.4.b.err 2.4.b.out;
total 16
-rw-r--r--  1 andrey  staff     0B Oct 13 00:36 2.4.b.err
-rw-r--r--  1 andrey  staff     0B Oct 13 00:36 2.4.b.out
-rw-r--r--  1 andrey  staff   7.8K Oct 13 00:36 Lab4.md
-rw-r--r--  1 andrey  staff     0B Oct 12 23:52 answers.sh
total 16
-rw-r--r--  1 andrey  staff     0B Oct 13 00:36 2.4.b.err
-rw-r--r--  1 andrey  staff     0B Oct 13 00:36 2.4.b.out
-rw-r--r--  1 andrey  staff   7.8K Oct 13 00:36 Lab4.md
-rw-r--r--  1 andrey  staff     0B Oct 12 23:52 answers.sh
ls -lh 2> >(tee 2.4.d.err >&2) | tee 2.4.d.out;
cat 2.4.d.err 2.4.d.out;
total 24
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.b.err
-rw-r--r--  1 andrey  staff   356B Oct 13 00:37 2.4.b.out
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.d.err
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.d.out
-rw-r--r--  1 andrey  staff   6.7K Oct 13 00:37 Lab4.md
-rw-r--r--  1 andrey  staff     0B Oct 12 23:52 answers.sh
total 24
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.b.err
-rw-r--r--  1 andrey  staff   356B Oct 13 00:37 2.4.b.out
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.d.err
-rw-r--r--  1 andrey  staff     0B Oct 13 00:37 2.4.d.out
-rw-r--r--  1 andrey  staff   6.7K Oct 13 00:37 Lab4.md
-rw-r--r--  1 andrey  staff     0B Oct 12 23:52 answers.sh
```

## Part 3
### Task 5
Copy all files from some local `/directory_local` to the remote `/directory_remote` only if their size is between 10MB and 20MB. And show the progress

```bash
mkdir ./directory_local;
# random large file
head -c 15728640 </dev/urandom > ./directory_local/15mb.txt;
head -c 5242880  </dev/urandom > ./directory_local/5mb.txt;
head -c 26214400 </dev/urandom > ./directory_local/25mb.txt;
ls -lh ./directory_local;
cd ./directory_local;
find . -type f -size +10M -size -20M -exec echo '{}' \; > files_to_copy.txt;
cat files_to_copy.txt;
cd ..;
rsync -avz --progress --files-from=./directory_local/files_to_copy.txt ./directory_local ansafronov@51.250.110.135:~/directory_remote;
ssh ansafronov@51.250.110.135 'ls -lh ~/directory_remote' 
```

```console
Lab4(main) ✗: mkdir ./directory_local;
Lab4(main) ✗: head -c 15728640 </dev/urandom > ./directory_local/15mb.txt;
Lab4(main) ✗: head -c 5242880  </dev/urandom > ./directory_local/5mb.txt;
Lab4(main) ✗: head -c 26214400 </dev/urandom > ./directory_local/25mb.txt;
Lab4(main) ✗: ls -lh ./directory_local;
Lab4(main) ✗: cd ./directory_local;
total 92544
-rw-r--r--  1 andrey  staff    15M Oct 13 00:57 15mb.txt
-rw-r--r--  1 andrey  staff    25M Oct 13 00:57 25mb.txt
-rw-r--r--  1 andrey  staff   5.0M Oct 13 00:57 5mb.txt
directory_local(main) ✗: find . -type f -size +10M -size -20M -exec echo '{}' \; > files_to_copy.txt;
directory_local(main) ✗: cat files_to_copy.txt;
./15mb.txt
directory_local(main) ✗: cd ..
Lab4(main) ✗: rsync -avz --progress --files-from=./directory_local/files_to_copy.txt ./directory_local ansafronov@51.250.110.135:~/directory_remote
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
building file list ... 
2 files to consider
./
15mb.txt
    15728640 100%   33.49MB/s    0:00:00 (xfer#1, to-check=0/2)

sent 15736460 bytes  received 48 bytes  3497001.78 bytes/sec
Lab4(main) ✗: ssh ansafronov@51.250.110.135 'ls -lh ~/directory_remote'               
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
total 15M
-rw-r--r-- 1 ansafronov ansafronov 15M Oct 12 21:57 15mb.txt
```

### Task 6
Copy all files from some local `/directory_local` to the remote `/directory_remote` only if their names don't start with “a” and don’t end with “z”. And show the progress

Answer:
```bash
touch ./directory_local/a ./directory_local/b ./directory_local/c ./directory_local/az;
cd directory_local;
rsync -avz --progress --exclude='a*' --exclude='*z' . ansafronov@51.250.110.135:~/directory_remote;
ssh ansafronov@51.250.110.135 'ls -lh ~/directory_remote' 
```

Output:
```console
Lab4(main) ✗: touch ./directory_local/a ./directory_local/b ./directory_local/c ./directory_local/az;
Lab4(main) ✗: cd directory_local;
directory_local(main) ✗: rsync -avz --progress --exclude='a*' --exclude='*z' . ansafronov@51.250.110.135:~/directory_remote;
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
building file list ... 
10 files to consider
./
25mb.txt
    26214400 100%   40.47MB/s    0:00:00 (xfer#1, to-check=7/10)
5mb.txt
     5242880 100%    6.82MB/s    0:00:00 (xfer#2, to-check=6/10)
b
           0 100%    0.00kB/s    0:00:00 (xfer#3, to-check=5/10)
c
           0 100%    0.00kB/s    0:00:00 (xfer#4, to-check=4/10)
files_to_copy.txt
          11 100%    0.01kB/s    0:00:00 (xfer#5, to-check=3/10)

sent 31473133 bytes  received 154 bytes  5722415.82 bytes/sec
total size is 47185931  speedup is 1.50
```

### Task 7
Copy the directory structure without copying files from a local `/directory_local` to the remote `/directory_remote`. Hint: use -f flag and regular expression pattern

Answer:
```bash
mkdir ./directory_local/my_folder;
mkdir ./directory_local/my_folder/new_folder;
mkdir ./directory_local/your_folder;
cd ./directory_local;
rsync -av -f"+ */" -f"- *" . ansafronov@51.250.110.135:~/directory_remote;
ssh ansafronov@51.250.110.135 'ls -lh ~/directory_remote' 
```

```console
Lab4(main) ✗: mkdir ./directory_local/my_folder;
Lab4(main) ✗: mkdir ./directory_local/my_folder/new_folder;
Lab4(main) ✗: mkdir ./directory_local/your_folder;
Lab4(main) ✗: cd ./directory_local;
directory_local(main) ✗: rsync -av -f"+ */" -f"- *" . ansafronov@51.250.110.135:~/directory_remote;
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
building file list ... done
./
my_folder/
my_folder/new_folder/
your_folder/

sent 155 bytes  received 44 bytes  56.86 bytes/sec
total size is 0  speedup is 0.00
directory_local(main) ✗: ssh ansafronov@51.250.110.135 'ls -lh ~/directory_remote'
Enter passphrase for key '/Users/andrey/.ssh/id_ed25519': 
total 46M
-rw-r--r-- 1 ansafronov ansafronov  15M Oct 12 21:57 15mb.txt
-rw-r--r-- 1 ansafronov ansafronov  25M Oct 12 21:57 25mb.txt
-rw-r--r-- 1 ansafronov ansafronov 5.0M Oct 12 21:57 5mb.txt
-rw-r--r-- 1 ansafronov ansafronov    0 Oct 12 22:07 b
-rw-r--r-- 1 ansafronov ansafronov    0 Oct 12 22:07 c
-rw-r--r-- 1 ansafronov ansafronov   11 Oct 12 22:00 files_to_copy.txt
drwxr-xr-x 3 ansafronov ansafronov 4.0K Oct 12 22:10 my_folder
drwxr-xr-x 2 ansafronov ansafronov 4.0K Oct 12 22:10 your_folder
```

## Part 4

### Task 8
From the files in logs.tar.xz output the top 3 most frequent IP addresses that performed the GET method from 10 to 17 hours 2015-01-13.
The answer for this task will be the top 3 most frequent IP addresses and their frequencies. And commands that you’ve used to obtain it

Answer:
```bash
mkdir logs;
tar -xzf practical4_logs.tar.xz -C logs;
grep "GET" logs/logs/logs_2015-01-13-1[0-9].tsv | awk -F ' ' '{print $2}' | uniq -c | sort -nr | head -n 3;
```

Output:
```console
Lab4(main) ✗: mkdir logs;
Lab4(main) ✗: tar -xzf practical4_logs.tar.xz -C logs;
Lab4(main) ✗: grep "GET" logs/logs/logs_2015-01-13-1[0-9].tsv | awk -F ' ' '{print $2}' | uniq -c | sort -nr | head -n 3;
   4 98.198.65.151
   4 77.1.28.230
   4 6.84.182.216
```

### Task 9
In the same archive find a list of all files with the .tsv extension that are larger than 5 MB and start archiving in the background.

Answer:
```bash
find logs/logs -size +5M | wc -l;
nohup find logs/logs -size +5M | tar -zcf ./logs_more_5M.tar --files-from=- &
```

Output:
```console
Lab4(main) ✗: find logs/logs -size +5M | wc -l;
      37
Lab4(main) ✗: nohup find logs/logs -size +5M | tar -zcf ./logs_more_5M.tar --files-from=- &
[1] 32360 32361
```

### Task 10
The data_for_science.tar.xz directory contains files of the following format: target class, tab, comma-separated list of keywords. Your task is to find unique words for the bad class, which are contained in the three largest files. Remember, DOG and dog are the same word.

```bash
mkdir data_for_science;
tar -xzf practical4_data_for_science.tar.xz -C data_for_science;
du -ab data_for_science/data_for_science | sort -n -r | head -n 3 > data_for_science_3largest_files.txt
```