### Using same Yubikey on another computer

Import your public keyring, eg in my case:

```
gpg --card-status # check to see if card is visible to the system  
gpg --search sharjeel.aziz@gmail.com # allows one to import public key
echo "test" | gpg --clearsign # test to see if it works
'''

After the above you should be able to use git commit -S

```
gpg2 --keyserver pgp.mit.edu --recv-key my-public-keyid
```
