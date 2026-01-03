# [Zabbix Agent2](https://github.com/zabbix/zabbix-docker/tree/7.4/Dockerfiles/agent2)

<div align="center">

### _Remote Monitoring Agent for Zabbix Server_

![][docker-pulls-badge] ![][github-issues-badge] ![][github-last-commit-badge]

![][github-stars-badge]

</div>

## [Overview](#top) 🚩

Zabbix Agent 2 is deployed on a monitoring target to actively monitor local resources.

[`^ Top`](#top)

## [Usage](#top) ⭐

> More detailed documentation can be found with the [Zabbix Agent 2 Docker Images](https://hub.docker.com/r/zabbix/zabbix-agent2)

Starting a Zabbix Agent 2 container will expose the Zabbix Agent 2 daemon on port 10050.

The agent can then either be connected to by a Zabbix server or proxy (passive checks):

```bash
docker run --name some-zabbix-server --link some-zabbix-agent:zabbix-agent2 --init -d zabbix/zabbix-server:latest
```

or connected to a Zabbix server or proxy (active checks)

```bash
docker run --name some-zabbix-agent --link some-zabbix-server:zabbix-server --init -d zabbix/zabbix-agent2:latest
```

### Container shell access and viewing Zabbix Agent 2 logs

The `docker exec` command allows you to run commands inside a Docker container.  The following command line will give you a bash shell inside your `zabbix-agent2` container:

```bash
docker exec -ti some-zabbix-agent2 /bin/bash
```

The Zabbix Agent 2 logs are available through Docker's container log:

```bash
docker logs some-zabbix-agent2
```

### Privileged Mode

By default, Docker containers are 'unprivileged' and do not have access to most host resources.  Zabbix Agent 2 is designed to monitor system resources, to do that the Zabbix Agent 2 container my be privileged - or you may mount some system-wide volumes.  For example:

```bash
docker run --name some-zabbix-agent --link some-zabbix-server:zabbix-server --privileged --init -d zabbix/zabbix-agent2:latest
```
```bash
docker run --name some-zabbix-agent --link some-zabbix-server:zabbix-server -v /dev/sdc:/dev/sdc --init -d zabbix/zabbix-agent2:latest
```

[`^ Top`](#top)

## [Configuration](#top) 🚧

When you start the zabbix-agent2 image, you can adjust the configuration of the Zabbix agent 2 by passing one or more environment variables on the docker run command line.

`ZBX_HOSTNAME` - A unique, case-sensitive hostname. Default: `hostname` of container
- It is the `hostname` parameter in `zabbix_agent2.conf`

`ZBX_SERVER_HOST` - The IP or DNS name of a Zabbix Server or Zabbix Proxy.  Default: `zabbix-server`.
- It is the `Server` parameter in `zabbix_agent2.conf`
- It is allowed to specify Zabbix Server or Proxy port number using `ZBX_SERVER_PORT` environment variable.
- Best used in the case of a non-default port for active checks.

`ZBX_PASSIVE_ALLOW` - Boolean; enables or disables passive checks. Default: `true`

`ZBX_PASSIVESERVERS` - Comma-separated list of allowed Zabbix Server or Proxy hosts for passive checks..

`ZBX_ACTIVE_ALLOW` - Boolean; enables or disables active checks. Default: `true`

`ZBX_ACTIVESERVERS` - Comma-separated list of allowed Zabbix Server or Proxy hosts for active checks.  May specify ports using the syntax `zabbix-server:10061,zabbix-proxy:10062`.

`ZBX_DEBUGLEVEL` - Integer; specifies debug level. Default: `3`.  Is `DebugLevel` parameter in `zabbix_agent2.conf`
- `0` - no debug output
- `1` - critical information
- `2` - error information
- `3` - warnings
- `4` - for debugging (produces lots of output)
- `5` - extended debugging (produces even more output)

`ZBX_TIMEOUT` - Integer; specifies connection timeout.  Default: `3`.

### Other Variables

A complete list of environment variables used by the image:

```dotenv
ZBX_ENABLEPERSISTENTBUFFER=false # Available since 5.0.0
ZBX_PERSISTENTBUFFERPERIOD=1h # Available since 5.0.0
ZBX_ENABLESTATUSPORT=
ZBX_SOURCEIP=
ZBX_HEARTBEAT_FREQUENCY=60 # Available since 6.2.0
ZBX_ENABLEREMOTECOMMANDS=0 # Deprecated since 5.0.0
ZBX_LOGREMOTECOMMANDS=0
ZBX_STARTAGENTS=3
ZBX_HOSTNAMEITEM=system.hostname
ZBX_METADATA=
ZBX_METADATAITEM=
ZBX_REFRESHACTIVECHECKS=120
ZBX_BUFFERSEND=5
ZBX_BUFFERSIZE=100
ZBX_MAXLINESPERSECOND=20
ZBX_LISTENIP=
ZBX_LISTENPORT=10051
ZBX_UNSAFEUSERPARAMETERS=0
ZBX_TLSCONNECT=unencrypted
ZBX_TLSACCEPT=unencrypted
ZBX_TLSCAFILE=
ZBX_TLSCA=
ZBX_TLSCRLFILE=
ZBX_TLSCRL=
ZBX_TLSSERVERCERTISSUER=
ZBX_TLSSERVERCERTSUBJECT=
ZBX_TLSCERTFILE=
ZBX_TLSCERT=
ZBX_TLSKEYFILE=
ZBX_TLSKEY=
ZBX_TLSPSKIDENTITY=
ZBX_TLSPSKFILE=
ZBX_TLSPSK=
ZBX_DENYKEY=system.run[*] # Available since 5.0.0
ZBX_ALLOWKEY= # Available since 5.0.0
```

These environment variables are identical to the corresponding parameters in `zabbix_agent2.conf`.  For example, `ZBX_REFRESHACTIVECHECKS = RefreshActiveChecks`.  Please consult the [official documentation](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_agent2) for `zabbix_agent2.conf` for more information.

### Zabbix Agent 2 Container Volume Hooks

### `/etc/zabbix/zabbix_agent.d`

The volume allows you to mount a directory containing custom configuration files for Zabbix Agent 2 (`*.conf`).  Using the `UserParameter` feature, you can also extend the agent from this hook.

### `/var/lib/zabbix/enc`

This volume stores TLS-related files.  The filenames are specified using the following environment variables: `ZBX_TLSCAFILE`, `ZBX_TLSCRLFILE`, `ZBX_TLSCERTFILE`, `ZBX_TLSKEYFILE`, and `ZBX_TLSPSKFILE`.  Additionally, you can use the following environment variables here with plaintext values: `ZBX_TLSCA`, `ZBX_TLSCRL`, `ZBX_TLSCERT`, `ZBX_TLSKEY`, `ZBX_TLSPSK`, and `ZBX_TLSPSK`.

### `/var/lib/zabbix/buffer`

This is the volume use to store the SQLite database used by Zabbix Agent2.  To enable this feature specify `ZBX_ENABLEPERSISTENTBUFFER=true`. (Available since 5.0.0)

## [Image Variants](#top) 🐋

The `zabbix-agent2` images come in many flavors, each designed for a specific use case:

### `zabbix-agent2:alpine-<version>`

This variant is based on the popular [Alpine Linux project](https://alpinelinux.org/) which, being much smaller than most distribution base images (~5MB) leads to much slimmer images in general.  Use when you need a small footprint.

### `zabbix-agent2:ubuntu-<version>`

This is the defacto image.  If you're unsure about what your needs are, you probably want to use this one.  It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as acting as a base image for other builds.

### `zabbix-agent2:ol-<version>`

Oracle Linux is an open-source OS suitable for general purpose or Oracle workloads.  It is known for its stability, being tested for more than 128,000 hours per day under real-world workloads and includes unique innovations such as `Ksplice` for zero-downtime patching, `DTrace` for real-time diagnostics, the powerful `BTRFS` file system, and more.



[`^ Top`](#top)

## [License](#top) ⚖️

[![][github-license-badge]][license-link]

[`^ Top`](#top)

[docker-pulls-badge]: https://img.shields.io/docker/pulls/zabbix/zabbix-agent2?labelColor=31383f
[docker-size-badge]: https://img.shields.io/docker/image-size/zabbix/zabbix-agent2?labelColor=31383f
[docker-stars-badge]: https://img.shields.io/docker/stars/zabbix/zabbix-agent2?style=social
[docker-version-badge]: https://img.shields.io/docker/v/zabbix/zabbix-agent2?labelColor=31383f
[github-issues-badge]: https://img.shields.io/github/issues/zabbix/zabbix-docker?labelColor=31383f
[github-last-commit-badge]: https://img.shields.io/github/last-commit/zabbix/zabbix-docker?labelColor=31383f
[github-stars-badge]: https://img.shields.io/github/stars/zabbix/zabbix-docker
[github-license-badge]: https://img.shields.io/badge/License-AGPLv3-blue?labelColor=31383f&style=flat-square

[license-link]: https://choosealicense.com/licenses/agpl-3.0/
