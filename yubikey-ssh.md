# Yubikey SSH Security Keys

## Using resident keys
If your security key supports FIDO2 resident keys you can save your SSH key to Yubikey making it easier to import the key on a new computer.

### Installation

```bash
brew install openssh
```
Add to shell rc file

```bash
export PATH=$(brew --prefix openssh)/bin:$PATH
```

```bash
source .zshrc
```

### Create

```bash
ssh-keygen -t ecdsa-sk -O resident
```

### New Computer
Make sure that ssh-agent is running on the new computer and run the following to use the SSH key:

```bash
ssh-add -K
```

This will load a “key handle” into the SSH agent and make the key available for use on the new computer. It works for short visits and you’ll need to run ssh-add again if you reboot the computer. 

To import the key permanently, instead run:

```bash
ssh-keygen -K
```

Remember to use the same password that you used when generating the key. This will write two files into the current directory: 

```id_ecdsa_sk_rk``` and ```id_ecdsa_sk_rk.pub```. Now you just need to rename the private key file to id_ecdsa_sk and move it into your SSH directory:

```bash
mv id_ecdsa_sk_rk ~/.ssh/id_ecdsa_sk
```

### Passwordless MFA
If your security key supports FIDO2 user verification you can enable it when creating your SSH key:

```bash
ssh-keygen -t ecdsa-sk -O verify-required
```

This will configure the security key to require a PIN or other user authentication whenever you use this SSH key. Your SSH access is now protected with passwordless multi-factor authentication.

#### Notes
“Resident keys” have been renamed to “discoverable credentials” in the WebAuthn and CTAP standards, but OpenSSH still uses the “resident key” terminology.

If you get an error while creating keys on a brand new Yubikey use Chrome to setup a PIN for the security key first.
