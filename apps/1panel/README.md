# [1Panel (Docker Version)](https://github.com/okxlin/docker-1panel)

<div align="center">

### _A new generation Linux server operation and maintenance management panel_

![][docker-pulls-badge] ![][docker-size-badge] ![][docker-version-badge] ![][github-issues-badge] ![][github-last-commit-badge]

![][github-stars-badge]

</div>

## [Features](#top) ✨

1Panel is a new generation Linux server operation and maintenance management panel.

- **Efficient Management**：Users can easily manage Linux servers through a web-based graphical interface
- **Deploy Websites**：Deeply integrated with WordPress and [Halo](https://github.com/halo-dev/halo/)
- **Native Appstore**：A carefully curated selection of high-quality open-source applications
- **Safe & Reliable**：Manages and deploys applications in containers and includes firewall & other security measures
- **1-Click Backup**：Supports 1-click backup and restore, allowing users to backup to various cloud storage media.

<div align="center">

1Panel 3-Minute Overview：https://www.youtube.com/watch?v=9d_uulrlg6M

</div>

[`^ Top`](#top)

## [Configuration](#top) 🚧

> - Due to internal container limitations, some features are currently incomplete. (`systemd`)
> - Instead of clicking on the lower-right corner of the containerized `1Panel` to update, you should pull the new image and redeploy it to apply the update.
> - 20230919: Add an auto-modify panel to display the application version, eliminating the need to manually modify the database.

- Default port: `10086`
- Default user: `1panel`
- Default pass: `1panel_password`
- Default entry: `entrance`

<hr />

### [Adjustable Parameters](#top)

> It is recommended to use the `/opt` path for file storage, otherwise some applications may have exceptions when calling local files.

- `/opt:opt` File storage mapping
- `TZ=Australia/Brisbane` Time zone setting
- `1panel` Container name
- `/var/lib/docker/volumes:/var/lib/docker/volumes` Storage volume mapping

Pull the latest image:

```bash
docker pull moelin/1panel:latest
```

[`^ Top`](#top)

## [Manual Install](#top) 📂

Execute the following command to install 1Panel with one click:

```sh
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
```

[`^ Top`](#top)

## [Install with Docker](#top) 🐋

```bash
docker run -d \
    --name 1panel \
    --restart always \
    --network host \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker/volumes:/var/lib/docker/volumes \
    -v /opt:/opt \
    -v /root:/root \
    -e TZ=Asia/Shanghai \
    moelin/1panel:latest
```

[`^ Top`](#top)

## [Install with Docker-Compose](#top) 📃

Create a `docker-compose.yml` file in the current directory and add the following content:

```bash
version: '3'
services:
  1panel:
    container_name: 1panel
    restart: always
    network_mode: "host"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/volumes:/var/lib/docker/volumes
      - /opt:/opt  # File storage
      - /root:/root  # Optional File Storage
    environment:
      - TZ=Asia/Shanghai  # 时区设置
    image: moelin/1panel:latest
    labels:  
      createdBy: "Apps"
```
Then `docker-compose up -d`

[`^ Top`](#top)

## [License](#top) ⚖️

[![][github-license-badge]][license-link]

[`^ Top`](#top)

[docker-pulls-badge]: https://img.shields.io/docker/pulls/moelin/1panel?labelColor=31383f
[docker-size-badge]: https://img.shields.io/docker/image-size/moelin/1panel?labelColor=31383f
[docker-stars-badge]: https://img.shields.io/docker/stars/moelin/1panel?style=social
[docker-version-badge]: https://img.shields.io/docker/v/moelin/1panel?labelColor=31383f
[github-issues-badge]: https://img.shields.io/github/issues/okxlin/docker-1panel?labelColor=31383f
[github-last-commit-badge]: https://img.shields.io/github/last-commit/okxlin/docker-1panel?labelColor=31383f
[github-stars-badge]: https://img.shields.io/github/stars/okxlin/docker-1panel
[github-license-badge]: https://img.shields.io/badge/License-GPLv3-blue?labelColor=31383f&style=flat-square

[license-link]: https://choosealicense.com/licenses/gpl-3.0/
