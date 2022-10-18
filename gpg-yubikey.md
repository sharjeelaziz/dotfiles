# Using  Yubikey on another computer

Import your public keyring.

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
git config --global user.name "Sharjeel Aziz"
```

## Errors
If you get an error message saying ```gpg: signing failed: Inappropriate ioctl for device```, do this:

```bash
export GPG_TTY=$(tty)
```

If you see errors that the secret key was not found it could be that the stubs were not imported by ```gpg --card-status``` command. 

You can manually import the stubs using ```gpg --recv-keys 3AA5C34371567BD2```

It could really be nothing. If it is having trouble calling pinentry try to decode a file to force pin entry.
