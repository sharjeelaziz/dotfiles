### Using  Yubikey on another computer

1. Import your public keyring.

  ```
  $ gpg --card-status # check to see if card is visible to the system  
  $ gpg --search sharjeel.aziz@gmail.com # allows one to import public key
  $ echo "test" | gpg --clearsign # test to see if it works
  ```

2. Use the gpg --list-secret-keys --keyid-format LONG command to list GPG keys for which you have both a public and private key. A private key is required for signing commits or tags.

  ```
  $ gpg --list-secret-keys --keyid-format LONG
  ```

  Note: Some GPG installations on Linux may require you to use gpg2 --list-keys --keyid-format LONG to view a list of your existing keys instead. In this case you will also need to configure Git to use gpg2 by running git config --global gpg.program gpg2.

3. From the list of GPG keys, copy the GPG key ID you'd like to use. In this example, the GPG key ID is 3AA5C34371567BD2:

  ```
  $ gpg --list-secret-keys --keyid-format LONG
  /Users/hubot/.gnupg/secring.gpg
  ------------------------------------
  sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
  uid                          Hubot
  ssb   4096R/42B317FD4BA89E7A 2016-03-10
  ```

4. To set your GPG signing key in Git, paste the text below, substituting in the GPG key ID you'd like to use. In this example, the GPG key ID is 3AA5C34371567BD2:

  ```
  $ git config --global user.signingkey 3AA5C34371567BD2
  $ git config --global user.email "sharjeel.aziz@gmail.com"
  $ git config --global user.name "Sharjeel Aziz"
  ```
