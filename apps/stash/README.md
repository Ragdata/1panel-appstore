<a name="top" href="https://github.com/stashapp/stash" target="_blank"><img height="100" align="right" src="logo.png" alt="1Panel" /></a>

![Docker Pulls Badge][docker-pulls-badge]
![Docker Size Badge][docker-size-badge]
![Docker Version Badge][docker-version-badge]
![GitHub Issues Badge][github-issues-badge]
![GitHub Last Commit Badge][github-last-commit-badge]
![GitHub Stars Badge][github-stars-badge]

# [Stash](https://github.com/stashapp/stash)

<center>

### _A media management tool for your collection of video and image files_

### [SITE](https://stashapp.cc/)&nbsp;&nbsp;🔸&nbsp;&nbsp;[DOCS](https://docs.stashapp.cc/)&nbsp;&nbsp;🔸&nbsp;&nbsp;[GITHUB](https://github.com/stashapp/stash)&nbsp;&nbsp;🔸&nbsp;&nbsp;[IMAGE](https://hub.docker.com/r/stashapp/stash)

</center>

## [Overview](#top) 🚩

Stash is a self-hosted media management tool written in Go which organizes and serves your diverse content collection, catering for both your SFW and NSFW needs.

<br />

![Stash Media Manager](screenshot.png)

<center>

#### [Watch the SFW Demo Video](https://vimeo.com/545323354)

</center>

## [Features](#top) ✨

- Gathers meta information about videos in your collection from the internet
- Extensible through the use of community-built plugins
- Supports a wide variety of both video and image formats
- Record information about Scenes, Performers, and Studios
- Multi-level tagging system

[`^ Top`](#top)

## [Installation](#top) 📂

Stash offers native binaries for the following platforms:

- Windows
- macOS
- Linux
- FreeBSD
- Docker

Step-by-step instructions are available for all platforms at https://docs.stashapp.cc/installation/

[`^ Top`](#top)

## [Usage](#top) ⭐

Stash is a web-based applicaiton.  Once it is running, the interface is available at http://localhost:9999

On the first run, Stash will prompt you for some configuration options and media directories for it to index (called 'Scanning' in Stash).  After scanning, your media will be available for browsing, curating, editing, and tagging.

Stash can pull metadata (performers, tags, descriptions, studios, images, and more) directly from many sites through the use of [scrapers](https://github.com/stashapp/stash/blob/develop/ui/v2.5/src/docs/en/Manual/Scraping.md), which integrate directly into Stash.  Identifying an entire collection will typically require a mix of multiple sources:

- The Stashapp team maintains [StashDb](https://stashdb.org/), a crowd-sourced repository of scene, studio, and performer information.  Connecting it to Stash will allow you to automatically identify much of a typical media collection.  It runs on our stash-box software and is primarily focused on mainstream digital scenes and studios.  Instructions, invite codes, and more can be found in this guide to [Accessing StashDB](https://guidelines.stashdb.org/docs/faq_getting-started/stashdb/accessing-stashdb/).
- Several community-managed stash-box databases can also be connected to Stash in a similar manner. Each one serves a slightly different niche and follows their own methodology. A rundown of each stash-box, their differences, and the information you need to sign up can be found in this guide to [Accessing Stash-Boxes](https://guidelines.stashdb.org/docs/faq_getting-started/stashdb/accessing-stash-boxes/).
- Many community-maintained scrapers can also be downloaded, installed, and updated from within Stash, allowing you to pull data from a wide range of other websites and databases. They can be found by navigating to `Settings → Metadata Providers → Available Scrapers → Community (stable)`. These can be trickier to use than a stash-box because every scraper works a little differently. For more information, please visit the [CommunityScrapers repository](https://github.com/stashapp/CommunityScrapers).
- All of the above methods of scraping data into Stash are covered in more detail in our [Guide to Scraping](https://docs.stashapp.cc/beginner-guides/guide-to-scraping/).

[`^ Top`](#top)

## [Resources](#top) 📖

- ### Documentation
  - Official Documentation: https://docs.stashapp.cc/
  - In-App Manual: https://docs.stashapp.cc/in-app-manual (or press <kbd>Shift</kbd>+<kbd>?</kbd> in the app)
  - FAQ: https://discourse.stashapp.cc/c/support/faq/28
  - Community Wiki: https://discourse.stashapp.cc/tags/c/community-wiki/22/stash
- ### Community & Discussion
  - Community Forum: https://discourse.stashapp.cc/
  - Discord Server: https://discord.gg/2TsNFKt
  - GitHub Discussions: https://github.com/stashapp/stash/discussions
  - Lemmy Community: https://discuss.online/c/stashapp
- ### Scrapers & Plugins
  - Metadata Sources: https://docs.stashapp.cc/metadata-sources/
  - Plugins: https://docs.stashapp.cc/plugins/
  - Themes: https://docs.stashapp.cc/themes/
  - Other Projects: https://docs.stashapp.cc/other-projects/

[`^ Top`](#top)

## [License](#top) ⚖️

[![AGPLv3 License][github-license-badge]][license-link]

[`^ Top`](#top)

[docker-pulls-badge]: https://img.shields.io/docker/pulls/stashapp/stash?labelColor=31383f
[docker-size-badge]: https://img.shields.io/docker/image-size/stashapp/stash?labelColor=31383f
[docker-stars-badge]: https://img.shields.io/docker/stars/stashapp/stash?style=social
[docker-version-badge]: https://img.shields.io/docker/v/stashapp/stash?labelColor=31383f
[github-issues-badge]: https://img.shields.io/github/issues/stashapp/stash?labelColor=31383f
[github-last-commit-badge]: https://img.shields.io/github/last-commit/stashapp/stash?labelColor=31383f
[github-stars-badge]: https://img.shields.io/github/stars/stashapp/stash
[github-license-badge]: https://img.shields.io/badge/License-AGPLv3-blue?labelColor=31383f&style=flat-square

[license-link]: https://choosealicense.com/licenses/agpl-3.0/

[//]: # ([github-license-badge]: https://img.shields.io/github/license/stashapp/stash)
