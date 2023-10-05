# 1. Using system package manager, install package figlet, run command figlet hello ubuntu, remove package
# figlet

sudo apt -y install figlet;
figlet hello ubuntu;
sudo apt -y remove figlet;

# 2. Create 10 files with template file{number} within one command. Search within the tree for all files that
# end with a number and delete files from 4-6 files (Don’t Use rm command).

touch file_{1..10}.txt;
find -regex  ".*/.*[4-6].txt" -delete;

# 3. List the contents of your current directory, including the ownership and permissions, and redirect the
# output to a file called contents.txt within your home directory.

ls -l > contents.txt;

# 4. Count the number of files called test within the /usr/share directory and its subdirectories. Note:
# each line output from the find command represents a file.

find /usr/share -name "test" | wc -l;

# 5. Sort the /etc/passwd file, place the results in a file called foo.txt, and trap any errors in a file called
# err.txt

sort /etc/passwd > foo.txt 2> err.txt;

# 6. Create a directory named Box where all the files are automatically owned by the group users, and can
# only be deleted by the user who created them.
# 7. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at the
# first depth level (e.g. at practical_1_unix_local_machine_1/ but not deeper)
# 8. In the provided data practical_1_unix_local_machine_1.zip, count the number of txt files residing at
# any depth level and with the prefix “00221”
# 9. In the provided data practical_1_unix_local_machine_1.zip, count the number of lines in each txt file
# 10. Calculate the size of each root (/) subdirectory and sort them by size.
# 11. Calculate the size of all directories located at filesystem root (/) except the /sys and print the results
# for the largest one.
# 12. Calculate the size of all directories located at filesystem root (/) except the /sys and excluding zero-
# sized directories, and print all results.
