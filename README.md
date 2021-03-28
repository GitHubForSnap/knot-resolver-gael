# [knot-resolver-gael](https://snapcraft.io/knot-resolver-gael)

Knot Resolver is a caching full resolver implementation written in C and LuaJIT, both a resolver library and a daemon. The core architecture is tiny and efficient, and provides a foundation and a state-machine like API for extensions. There are three modules built-in - iterator, validator, cache, and a few more are loaded by default. Most of the rich features are written in Lua(JIT) and C. Batteries are included, but optional.

The LuaJIT modules, support DNS privacy and DNSSEC, and persistent cache with low memory footprint make it a great personal DNS resolver or a research tool to tap into DNS data. TL;DR it's the OpenResty of DNS.

**First use**

* Read the doc at https://knot-resolver.readthedocs.io/en/stable/ on how to get started.

* Configure the resolver
`sudo vi /var/snap/knot-resolver-gael/current/kresd.conf`

* Restart Knot Resolver
`sudo snap restart knot-resolver-gael.kresd`

**2021-03-28**

* First release of knot-resolver-gael v5.3.0 on arm64 & armhf architectures
* Caveat: I don't have the hardware to test it properly

**2021-03-14**

* First release of knot-resolver-gael v5.3.0 on amd64
