# Importing your SSH key on another machine
On a new machine and before you can authenticate with GitHub we have two options:

Use '''ssh-add -K''' to load all resident keys from a YubiKey into your ssh-agent.
Use '''ssh-keygen -K''' to download all resident keys from a YubiKey and write them to your current directory. Enter the PIN and touch the key. 
In this scenario, ssh-agent will be able to load the keys from your disk which is more suitable for permanent use.

By default, OpenSSH will look for these paths to automatically load private keys:

~/.ssh/id_dsa
~/.ssh/id_ecdsa
~/.ssh/id_ecdsa_sk
~/.ssh/id_ed25519
~/.ssh/id_ed25519_sk
~/.ssh/id_rsa

Due to the current implementation of resident keys in OpenSSH, the no-touch-required flag is not restored when importing keys from a YubiKey. This flag will only be available with the original private key handle.

Using it
Git
Like normal ssh keys, resident keys are usable for git operations. Add the public key to your profile of your favorite git service and you're good to go.

At the time of writing, Gitea, GitHub and GitLab do not support no-touch-required. You'll have to touch the YubiKey for each git operation.

## SSH
Using a resident key for SSH is the same as using a regular key. Add the public key to your authorized_keys and you’re good to go. If the resident key was generated with no-touch-required, prepend this option to the public key.
~/.ssh/authorized_keys

# Without `no-touch-required` option
sk-ssh-ed25519@openssh.com ...

# With `no-touch-required` option
no-touch-required sk-ssh-ed25519@openssh.com ...
