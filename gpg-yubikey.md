# Using  Yubikey on another computer

## Install required software

```bash
sudo apt-get install scdaemon
```

### Mac Specific

Install the software

```bash
brew install gpg2 gnupg pinentry-mac

# Make the directory
mkdir ~/.gnupg

# Tells GPG which pinentry program to use
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

# This tells gpg to use the gpg-agent
echo 'use-agent' > ~/.gnupg/gpg.conf
```

Append the following to your ~/.bash_profile or ~/.bashrc or ~/.zshrc

```
export GPG_TTY=$(tty)
```

Restart your Terminal or source your ~/.*rc file

```bash
# on the built-in bash on macos use
source ~/.bash_profile
# if using bash through homebrew over ssh use
source ~/.bashrc
# and if using zsh
source ~/.zshrc
```
    
## Import your public keyring.

```bash
gpg --card-status # check to see if card is visible to the system  
curl https://keybase.io/sharjeelaziz/pgp_keys.asc -o public-key.asc # allows one to import public key
gpg --import public-key.asc
echo "test message string" | gpg --encrypt --armor --recipient <email> -o encrypted.txt
gpg --decrypt --armor encrypted.txt
```

Use the gpg --list-secret-keys --keyid-format LONG command to list GPG keys for which you have both a public and private key. A private key is required for signing commits or tags.

```bash
gpg --list-secret-keys --keyid-format LONG
```

Note: Some GPG installations on Linux may require you to use `gpg2 --list-keys --keyid-format LONG` to view a list of your existing keys instead. In this case you will also need to configure Git to use gpg2 by running `git config --global gpg.program gpg2`

From the list of GPG keys, copy the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

```bash
gpg --list-secret-keys --keyid-format LONG
```

```console
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

To set your GPG signing key in Git, paste the text below, substituting in the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

```bash
git config --global user.signingkey 3AA5C34371567BD2
git config --global user.email "<email>"
```

## Errors
If you get an error message saying ```gpg: signing failed: Inappropriate ioctl for device```, do this:

```bash
export GPG_TTY=$(tty)
```

If you see errors that the secret key was not found it could be that the stubs were not imported by ```gpg --card-status``` command. 

You can manually import the stubs using ```gpg --recv-keys 3AA5C34371567BD2```

It could really be nothing. If it is having trouble calling pinentry try to decode a file to force pin entry.

## Using Multiple Keys

To use a single identity with multiple YubiKeys - or to replace a lost card with another - issue this command to switch keys:

```console
$ gpg-connect-agent "scd serialno" "learn --force" /bye
```

Alternatively, use a script to delete the GnuPG shadowed key, where the card serial number is stored (see [GnuPG #T2291](https://dev.gnupg.org/T2291)):

```console
$ cat >> ~/scripts/remove-keygrips.sh <<EOF
#!/usr/bin/env bash
(( $# )) || { echo "Specify a key." >&2; exit 1; }
KEYGRIPS=$(gpg --with-keygrip --list-secret-keys "$@" | awk '/Keygrip/ { print $3 }')
for keygrip in $KEYGRIPS
do
    rm "$HOME/.gnupg/private-keys-v1.d/$keygrip.key" 2> /dev/null
done

gpg --card-status
EOF

$ chmod +x ~/scripts/remove-keygrips.sh

$ ~/scripts/remove-keygrips.sh $KEYID
```

See discussion in Issues [#19](https://github.com/drduh/YubiKey-Guide/issues/19) and [#112](https://github.com/drduh/YubiKey-Guide/issues/112) for more information and troubleshooting steps.
