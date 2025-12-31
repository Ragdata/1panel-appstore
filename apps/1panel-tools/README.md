<a name="top" href="https://github.com/arch3rPro/1Panel-Tools" target="_blank"><img height="100" align="right" src="logo.png" alt="1Panel" /></a>

![Docker Pulls Badge][docker-pulls-badge]
![Docker Size Badge][docker-size-badge]
![Docker Version Badge][docker-version-badge]
![GitHub Issues Badge][github-issues-badge]
![GitHub Last Commit Badge][github-last-commit-badge]
![GitHub Stars Badge][github-stars-badge]

# [1Panel-Tools](https://github.com/arch3rPro/1Panel-Tools)

<center>

### _A specialized toolkit to simplify the packaging of apps for the 1Panel AppStore_

#### [GITHUB](https://github.com/arch3rPro/1Panel-Tools)&nbsp;&nbsp;🔸&nbsp;&nbsp;[IMAGE](https://hub.docker.com/r/vuldocker/1panel-tools)

</center>

## [Overview](#top) 🚩

1Panel-Tools is a specialized toolkit designed to simplify the process of creating applications for the 1Panel AppStore. The primary tool in this collection is the Docker Compose to 1Panel AppStore converter, which transforms standard Docker Compose files into the format required by the 1Panel AppStore.

![1Panel-Tools](https://cdn.jsdelivr.net/gh/arch3rPro/1Panel-Tools@main/public/1Panel-Tools.png)

[`^ Top`](#top)

## [Features](#top) ✨

- **Docker Compose Conversion**: Automatically convert Docker Compose files to 1Panel AppStore format
- **Parameter Configuration**: Easily define and manage application parameters
- **Metadata Management**: Set application name, description, tags, and other metadata
- **Multi-language Support**: Configure descriptions in both English and Chinese
- **Export Functionality**: Download the converted files ready for 1Panel AppStore submission

[`^ Top`](#top)

## [Usage](#top) ⭐

1. **Input Docker Compose**: Paste your Docker Compose file into the editor
2. **Configure Application**: Set the application name, key, description, and other metadata
3. **Define Parameters**: Add parameters for your application (ports, environment variables, etc.)
4. **Preview Conversion**: Review the generated 1Panel AppStore files
5. **Export**: Download the converted files for use with 1Panel AppStore

[`^ Top`](#top)

## [1Panel AppStore Format](#top) 📁

The converter generates files following the 1Panel AppStore format:

```
├── app-key/
    ├── logo.png
    ├── data.yml
    ├── README.md
    └── version/
        ├── data.yml
        ├── docker-compose.yml
        └── scripts/
```

[`^ Top`](#top)

## [License](#top) ⚖️

[![GPLv3 License][github-license-badge]][license-link]

[`^ Top`](#top)

[docker-pulls-badge]: https://img.shields.io/docker/pulls/vuldocker/1panel-tools?labelColor=31383f
[docker-size-badge]: https://img.shields.io/docker/image-size/vuldocker/1panel-tools?labelColor=31383f
[docker-stars-badge]: https://img.shields.io/docker/stars/vuldocker/1panel-tools?style=social
[docker-version-badge]: https://img.shields.io/docker/v/vuldocker/1panel-tools?labelColor=31383f
[github-issues-badge]: https://img.shields.io/github/issues/arch3rPro/1Panel-Tools?labelColor=31383f
[github-last-commit-badge]: https://img.shields.io/github/last-commit/arch3rPro/1Panel-Tools?labelColor=31383f
[github-stars-badge]: https://img.shields.io/github/stars/arch3rPro/1Panel-Tools
[github-license-badge]: https://img.shields.io/badge/License-GPLv3-blue?labelColor=31383f&style=flat-square

[license-link]: https://choosealicense.com/licenses/gpl-3.0/
