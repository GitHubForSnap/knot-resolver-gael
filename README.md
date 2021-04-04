# [knot-resolver-gael](https://snapcraft.io/knot-resolver-gael)

Knot Resolver is a caching full resolver implementation written in C and LuaJIT, both a resolver library and a daemon. The core architecture is tiny and efficient, and provides a foundation and a state-machine like API for extensions. There are three modules built-in - iterator, validator, cache, and a few more are loaded by default. Most of the rich features are written in Lua(JIT) and C. Batteries are included, but optional.

The LuaJIT modules, support DNS privacy and DNSSEC, and persistent cache with low memory footprint make it a great personal DNS resolver or a research tool to tap into DNS data. TL;DR it's the OpenResty of DNS.

**First use**

* Read the doc at https://knot-resolver.readthedocs.io/en/stable/ on how to get started.

* Configure the resolver
`sudo vi /var/snap/knot-resolver-gael/current/kresd.conf`

* Restart Knot Resolver
`sudo snap restart knot-resolver-gael.kresd`

**Deny domain resolution (refreshed every 4hrs)**

* Enter hosts lists URLs (optional)
`sudo vi /var/snap/knot-resolver-gael/common/policies/deny_hosts.url`

```
   # Sample deny host files URLs
   
   https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts;showintro=0
   https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
   https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt
   http://sysctl.org/cameleon/hosts
```

* Enter domains lists URLs (optional)
`sudo vi /var/snap/knot-resolver-gael/common/policies/deny_domains.url`

```
   # Sample deny domains URLs
   
   https://gitlab.com/quidsup/notrack-blocklists/raw/master/notrack-blocklist.txt
   https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
   https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
   https://v.firebog.net/hosts/AdguardDNS.txt
   https://v.firebog.net/hosts/Easyprivacy.txt
```

* Add the deny policy list to kresd.conf
`sudo vi /var/snap/knot-resolver-gael/current/kresd.conf`

```
   policy.add(policy.rpz(policy.DENY, '/var/snap/knot-resolver-gael/common/policies/deny_policy.rpz',true))
```

**2021-04-04**

* Update to v5.3.1

**2021-03-28**

* First release of knot-resolver-gael v5.3.0 on arm64 architecture
* Caveat: I don't have the hardware to test it properly

**2021-03-14**

* First release of knot-resolver-gael v5.3.0 on amd64
