### Using same Yubikey on another computer

Import your public keyring, eg in my case:

```
gpg2 --keyserver pgp.mit.edu --recv-key my-public-keyid
```

On the first computer export secrets, in Yubikey case this should export only stubs which tell GPG to look for the key on a hardware token:

```
gpg2 --export-secret-keys -a -o secrets
```

Copy the file to new machine:

```
scp secrets new-machine:
```

On the new machine:

```
gpg2 --import secrets
```
