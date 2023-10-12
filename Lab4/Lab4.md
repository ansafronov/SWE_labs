# Lab 4

## Part 1

### Task 1 
ssh-keygen:
a. Generate a ed25519 key with 1024 bits and store it to files with new_key_ed25519 prefix
b. Change the passphrase of this key

Answer:
```bash
ssh-keygen -t ed25519 -b 1024 -f .ssh/new_key_ed25519;
ssh-keygen -p -f .ssh/new_key_ed25519;
```

Output
```console
~: ssh-keygen -t ed25519 -b 1024 -f .ssh/new_key_ed25519
Generating public/private ed25519 key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in .ssh/new_key_ed25519
Your public key has been saved in .ssh/new_key_ed25519.pub
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
~: ssh-keygen -p -f .ssh/new_key_ed25519;
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
ssh-copy-id -n -i new_key_ed25519.pub ansafronov@51.250.110.135
```