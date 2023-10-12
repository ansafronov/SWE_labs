#!/usr/bin/env bash

echo "======1st task======";
# 1. Using system package manager, install package figlet, run command figlet hello ubuntu, remove package
# figlet

sudo apt -y install figlet;
figlet hello ubuntu;
sudo apt -y remove figlet;

echo "======2nd task======";
# 2. Create 10 files with template file{number} within one command. Search within the tree for all files that
# end with a number and delete files from 4-6 files (Don’t Use rm command).

touch file_{1..10}.txt;
find -regex  ".*/.*[4-6].txt" -delete;

echo "======3rd task======";
# 3. List the contents of your current directory, including the ownership and permissions, and redirect the
# output to a file called contents.txt within your home directory.

ls -l > contents.txt;

echo "======4th task======";
# 4. Count the number of files called test within the /usr/share directory and its subdirectories. Note:
# each line output from the find command represents a file.

find /usr/share -name "test" | wc -l;

echo "======5th task======";
# 5. Sort the /etc/passwd file, place the results in a file called foo.txt, and trap any errors in a file called
# err.txt

sort /etc/passwd > foo.txt 2> err.txt;

echo "======6th task======";
# 6. Create a directory named Box where all the files are automatically owned by the group users, and can
# only be deleted by the user who created them.

mkdir -p Box;
# need check, here is calculator https://chmod-calculator.com
chmod g+s Box;
chmod +t Box;

echo "======7th task======";
# 7. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at the
# first depth level (e.g. at practical_1_unix_local_machine_1/ but not deeper)

find practical_1_unix_local_machine_1 -maxdepth 1 -name "*.txt" | wc -l;

echo "======8th task======";
# 8. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at
# any depth level and with the prefix “00221”

find practical_1_unix_local_machine_1 -name "00221*.txt" | wc -l

echo "======9th task======";
# 9. In the provided data practical_1_unix_local_machine_1.zip, count the number of lines in each txt file

for file in $(find practical_1_unix_local_machine_1/ -name "*.txt")
do
    wc -l $file;
done;

echo "======10th task======";
# 10. Calculate the size of each root (/) subdirectory and sort them by size.

sudo du -sh /* | sort -rh

echo "======11th task======";
# 11. Calculate the size of all directories located at filesystem root (/) except the /sys and print the results
# for the largest one.

sudo du -sh --exclude=/sys /* | sort -rh | head -n 1;

echo "======12th task======";
# 12. Calculate the size of all directories located at filesystem root (/) except the /sys and excluding zero-
# sized directories, and print all results.

for dir in /*; do
    if [ "$dir" != "/sys" ]; then
        # Calculate size using "du" command and extract the size value
        size=$(sudo du -s "$dir" | awk '{print $1}')
        
        # Check if the size is non-zero and print the result
        if [ $size -ne 0 ]; then
            echo "$(echo $size | numfmt --to=iec)\t$dir"
        fi
    fi
done;

