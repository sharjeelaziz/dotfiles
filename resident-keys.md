
## Discoverable (resident) vs Non-Discoverable Credentials

Benefits of Non-discoverable keys:

* Cannot be used by another person without the credential id file, even if the PIN is known.
* Ideal for systems where privacy is important if the key is lost or stolen

Benefits of Discoverable keys:

* Can be taken to any compatible workstation and used to authenticate by touch and FIDO2 PIN
* Ideal for ease of access where the PIN is known

### Setting up OpenSSH for FIDO2 Authentication

Regardless of which credential option is selected, there are some prerequisites:

* Local and remote systems must be running OpenSSH 8.3 or higher
* FIDO2 PIN must be set on the key. This can be accomplished using YubiKey Manager or Chrome browser (```chrome://settings/securityKeys```)

On the client side, you can also append `verify-required` to a `~/.ssh/authorized_keys` entry to have sshd check the UV flag for that credential only:

```
cat .ssh/authorized_keys
sk-ssh-ed25519@openssh.com <EntryID> verify-required
```

## Discoverable Key Instructions

Open a Terminal window and type the following command to generate a key using the ecdsa curve:

```bash
ssh-keygen -t ecdsa-sk -O resident -O verify-required
```

To use the ed25519 curve (not supported by all keys), use the following command instead:

```bash
ssh-keygen -t ed25519-sk -O resident -O verify-required
```

Enter the PIN and touch the device when promted. Note that not all systems may ask for the user to touch their key, but only require the PIN.

By default, the generated filenames will be `id_ecdsa_sk` & `id_ecdsa_sk.pub`. The first file, `id_ecdsa_sk`, contains a reference to the private key. The second file, `id_ecdsa_sk.pub`, contains the public key which is used on a remote system to verify authentication. The public key can be added to a remote server with the following command:

```bash
ssh-copy-id -i ~/.ssh/id_ecdsa_sk.pub <user@host>
```

### Using a discoverable credential on another computer
    
Open a Terminal window and type the following commands to copy files:

```bash
cd ~/.ssh
ssh-keygen -K
```

SSH will ask the user to enter your PIN and touch the device.

If this is the only credential on the system, you can rename the exported credentials as `id_ecdsa_sk` and `id_ecdsa_sk.pub` to allow seamless authentication. In case of multiple credentials you can use the `-i` option to select a private key:

```bash
ssh -i .ssh/token2_sk <user@host>
```

## Non Discoverable Key Instructions

Open a Terminal window and type the following command to generate a key using the ecdsa curve:

```bash
ssh-keygen -t ecdsa-sk
```

SSH will request the user to enter their PIN and touch the device.

SSH will save two files. A user can check their console and to display the actual filenames. By default, these filenames will be `id_ecdsa_sk` & `id_ecdsa_sk.pub`, but may be different dependent on whether or not it was changed to something else when prompted for a save location. 

The first file, `id_ecdsa_sk`, contains a reference to the private key credential stored on the key. The second file, `id_ecdsa_sk.pub`, contains the public key which is used on a remote system to verify authentication.

The public key can be added to a remote server with the following command:

```bash
ssh-copy-id -i ~/.ssh/id_ecdsa_sk.pub user@host
```

### Using non-discoverable keys on another computer

Copy the id_ecdsa_sk file and id_ecdsa_sk.pub generated earlier to the` ~/.ssh` folder on this computer.

SSH to the remote system and touch the key when prompted.

