# Heartbox
Sets up a basic Freebsd 10.0 VirtualBox running Apache 2.4 and OpenSSL 1.0.1e-freebsd for playing with heartbleed exploits.

## Prereqs
* Install Vagrant and VirtualBox.
* Install NFS server. On Debian-based systems:
```
apt-get install nfs-common nfs-kernel-server portmap
```

## Starting VM
Run `vagrant up`. This will set up the guest machine. XXX: The VirtualBox provisioning script (install.sh) hasn't been tested since I set up Apache and keys manually. In any case, you should just be able to use the standard Apache setup instructions with mod_ssl enabled by default.

## Playing with Heartbleed
Make sure Apache is up and running on the guest machine. Try going to `https://10.0.1.10/` in your browser on the host machine - you should get a self-signed cert warning.

Now you can run `python utils/ssltest.py 10.0.1.10` from the host machine - it should tell you that the server is vulnerable!

`ssltest-multiple-tls.py` sequentially attempts different heartbeat payloads in case a server doesn't accept the usual one (which reportedly fails on servers that do not support TLS 1.2).
