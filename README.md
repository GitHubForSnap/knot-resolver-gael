# [knot-resolver-gael](https://snapcraft.io/knot-resolver-gael)

_This is NOT an original piece of work, just a snap of Knot Resolver_

Knot Resolver is a caching full resolver implementation written in C and LuaJIT, both a resolver library and a daemon. The core architecture is tiny and efficient, and provides a foundation and a state-machine like API for extensions. There are three modules built-in - iterator, validator, cache, and a few more are loaded by default. Most of the rich features are written in Lua(JIT) and C. Batteries are included, but optional.

The LuaJIT modules, support DNS privacy and DNSSEC, and persistent cache with low memory footprint make it a great personal DNS resolver or a research tool to tap into DNS data. TL;DR it's the OpenResty of DNS.

**First use**

* Read the doc at https://knot-resolver.readthedocs.io/en/stable/ on how to get started.

* Configure the resolver
`sudo vi /var/snap/knot-resolver-gael/current/kresd.conf`

* Start and enable Knot Resolver
`sudo snap start --enable knot-resolver-gael.kresd`

* Read the logs
`sudo snap logs -n 30 knot-resolver-gael.kresd`

**Deny domain resolution (refreshed every 4 hrs)**

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

* Restart deny policy
`sudo snap restart knot-resolver-gael.deny-policy`

* Read the logs
`sudo snap logs -n 30 knot-resolver-gael.deny-policy`

* Add the deny policy list to kresd.conf
`sudo vi /var/snap/knot-resolver-gael/current/kresd.conf`

```
   policy.add(policy.rpz(policy.DENY, '/var/snap/knot-resolver-gael/common/policies/deny_policy.rpz',true))
```

* Restart Knot Resolver
`sudo snap restart knot-resolver-gael.kresd`

* Read the logs
`sudo snap logs -n 30 knot-resolver-gael.kresd`

**2023-02-08**

* Updated to v5.6.0
* knot-resolver-gael will now use core22 as most of the users are on Ubuntu 22.04

**2022-10-26**

* Remove carriage returns in deny_policy.rpz

**2022-09-26**

* Updated to v5.5.3
* Fix CVE-2022-40188

**2022-07-27**

* New build to resolve CVE-2022-33070/USN-5531-1

**2022-06-14**

* Updated to v5.5.1

**2022-03-20**

* Updated to v5.5.0

**2022-01-11**

* Updated to v5.4.4

**2021-12-13**

* Updated to v5.4.3

**2021-10-14**

* Updated to v5.4.2

**2021-08-22**

* Updated to v5.4.1
* Dependencies cleanup

**2021-08-16**

* Added DNStap module. See [dnstap-gael](https://snapcraft.io/dnstap-gael)

**2021-07-30**

* Updated to v5.4.0

**2021-07-08**

* New build to resolve CVE-2021-22918/USN-5007-1

**2021-05-11**

* Updated to v5.3.2

**2021-04-11**

* Updated to v5.3.1
* Added deny list with Response Policy Zone (RPZ) refreshed every 4 hrs

**2021-03-28**

* First release of knot-resolver-gael v5.3.0 on arm64 architecture
* Caveat: I don't have the hardware to test it properly

**2021-03-14**

* First release of knot-resolver-gael v5.3.0 on amd64
