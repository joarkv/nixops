Nixops for Hackeriet Infrastructure
=====

Trying out nixops for some hackeriet infrastructure. Entire servers are
specified here, and can ble applied with one command. Pretty neat =) Oh, and
patches/pointers are very welcome.

To add a user on servers, add yourself to the users.nix file and deploy changes.
Root passwords are in hackerpass.

Servers:
---

  * nux.hackeriet.no 
    - grafana + influxdb + nginx

Todo:
---

  - [ ] How to handle secrets? Need for:
    - telegraf + mqtt feed
    - influxdb should be set up with username/password for admin and ro.
    - influxdb/ro should be used by grafana, how to store?

Commands:
---
To add the depolyment to your nixops environment

```$ nixops create -d hackerops deployment.nix```

To deploy/update:

```$ nixops deploy -d hackerops```

To check server status

```$ nixops check -d hackerops```

To reboot

```$ nixops reboot -d hackerops```

Skeleton client config
---

```
[Interface]
PrivateKey = INSERTPRIVATEKEYHERE
Address = 10.31.42.105/32
DNS = 1.1.1.1

[Peer]
PublicKey = 63NG3mMRR2R+RXtfErXcRQ8JedneNH0hB1I58ir6dlY=
AllowedIPs = 0.0.0.0/0
Endpoint = 185.35.202.197:51820
```

