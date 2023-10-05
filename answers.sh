#!/usr/bin/env bash
set -x;

echo "Starting 1st task";
# 1. Using system package manager, install package figlet, run command figlet hello ubuntu, remove package
# figlet

#sudo apt -y install figlet;
#figlet hello ubuntu;
#sudo apt -y remove figlet;
echo "Finished 1st task";

echo "Starting 2nd task";
# 2. Create 10 files with template file{number} within one command. Search within the tree for all files that
# end with a number and delete files from 4-6 files (Don’t Use rm command).

#touch file_{1..10}.txt;
#find -regex  ".*/.*[4-6].txt" -delete;
echo "Finished 2nd task";

echo "Starting 3rd task";
# 3. List the contents of your current directory, including the ownership and permissions, and redirect the
# output to a file called contents.txt within your home directory.

#ls -l > contents.txt;
echo "Finished 3rd task";

echo "Starting 4th task";
# 4. Count the number of files called test within the /usr/share directory and its subdirectories. Note:
# each line output from the find command represents a file.

#find /usr/share -name "test" | wc -l;
echo "Finished 3rd task";

echo "Starting 5th task";
# 5. Sort the /etc/passwd file, place the results in a file called foo.txt, and trap any errors in a file called
# err.txt

#sort /etc/passwd > foo.txt 2> err.txt;
echo "Finished 5th task";

echo "Starting 6th task";
# 6. Create a directory named Box where all the files are automatically owned by the group users, and can
# only be deleted by the user who created them.

#mkdir Box;
## need check
#chmod chmod -R 757 Box;
echo "Finished 6th task";

echo "Starting 7th task";
# 7. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at the
# first depth level (e.g. at practical_1_unix_local_machine_1/ but not deeper)

#find practical_1_unix_local_machine_1 -maxdepth 1 -name "*.txt" | wc -l;
echo "Finished 7th task";

echo "Starting 8th task";
# 8. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at
# any depth level and with the prefix “00221”

find practical_1_unix_local_machine_1 -name "00221*.txt" | wc -l
echo "Finished 8th task";

echo "Starting 9th task";
# 9. In the provided data practical_1_unix_local_machine_1.zip, count the number of lines in each txt file
# 10. Calculate the size of each root (/) subdirectory and sort them by size.
# 11. Calculate the size of all directories located at filesystem root (/) except the /sys and print the results
# for the largest one.
# 12. Calculate the size of all directories located at filesystem root (/) except the /sys and excluding zero-
# sized directories, and print all results.
