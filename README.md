<a name="top" href="https://github.com/ragdata" target="_blank"><img height="100" align="right" src="https://raw.githubusercontent.com/Ragdata/media/master/logo/Ragdata-64.svg" alt="1Panel-Appstore" /></a>

![Pre-Release][pre-release]
[![Version][version-badge]][release]

<h1>

[1Panel-Appstore][release]

</h1>

<div align="center">

### _A Collection of Self-Hosted Apps for 1Panel_

[![GitHub issues][issues-badge]][issues]
![Last Commit][last-commit]
[![AGPL][license-badge]][mit-license]
<br />
[![wakatime][wakatime-badge]][wakatime-repo]

</div>

<div align="center">

<a href="https://bsky.app/profile/aever.au" target="_blank"><img alt="Bluesky" src="https://img.shields.io/badge/Bluesky-0085ff?style=flat-square&logo=bluesky&logoColor=white" /></a>
<a href="mailto:github.discharge208@passfwd.com" target="_blank"><img alt="Bluesky" src="https://img.shields.io/badge/Email-00B4F0?style=flat-square&logo=maildotru&logoColor=white" /></a>
<a href="https://discord.com/users/146165361333633024" target="_blank"><img alt="Discord" src="https://img.shields.io/badge/Discord-5865f2?style=flat-square&logo=discord&logoColor=white" /></a>

</div>

<hr />

## [Requirements](#top) ❓

- Running instance of 1Panel 1.0.0 or higher

## [Features](#top) ✨

- 1-click update and synchronization of 1Panel's Official Appstore applications to your local environment
- Sync apps from _any_ third-party repository to 1Panel's Local Appstore
- Compatible with both public and private repositories under GitHub, GitLab, and Gitea
- Sync multiple distributed repository applications to 1Panel's Local Appstore
- Supports custom branches, clone depth, proxies, etc., for convenience and flexibility
- Synchronization script's source code is completely open source, so you can extend and modify it as required

[`^ Top`](#top)

## [Installation](#top) 📂

Clone this repository to a local directory on your 1Panel server:

```bash
git clone https://github.com/ragdata/1panel-appstore.git
````

Go to the root directory of the cloned repository:

```bash
cd 1panel-appstore
```

Modify the values of the environment file there:

```bash
cp .env.sample .env && nano .env
```

Set permissions and run the script:

```bash
chmod +x local_appstore_sync_helper.sh && ./local_appstore_sync_helper.sh
```

> [!note]
> Add `local_appstore_sync_helper.sh` to a 1Panel scheduled task to run it periodically and automatically synchronize applications in this repository to your 1Panel Local Appstore.

[`^ Top`](#top)

## [Configuration](#top) 🚧

`local_appstore_sync_helper.sh` contains several configurations options that can be modified to suit your needs:

```bash
# Location of the 1Panel Local App Directory (this directory needs to be specified if not default):
app_local_dir="/opt/1panel/resource/apps/local"

# Appstore Git Repository Address (required):
git_repo_url="https://github.com/Ragdata/1panel-appstore.git"
# Official 1Panel Appstore Repository URL:
# git_repo_url="https://github.com/1Panel-dev/appstore"

# GitHub Access Token (optional):
# Using Access Tokens is recommended to reduce the risk of password leaks
git_access_token=""

# Username for accessing the Git Repository; Optional when accessing private repositories:
git_username=""
# Password for accessing the Git Repository; Optional when accessing private repositories:
git_password=""

# Specify the branch to clone (optional):
git_branch="master"
# Specify the depth of the clone (optional):
git_depth=1

# Should the local app directory be cleared before cloning? (optional):
clean_local_app=false
# Should the remote app cache be cleared before cloning? (optional):
clean_remote_app_cache=false

# Configure the agent used when cloning or pulling a remote repository (optional):
proxyUrl=""
# Examples:
# proxyUrl="http://127.0.0.1:7890"
# proxyUrl="socks5://127.0.0.1:7890"
# proxyUrl="socks5://user:password@host:port"

# Clone the remote Appstore project to your local working directory:
work_dir="/opt/1panel_helper"
```

### [Configuration Details](#top)

|                     Item | Required? | Instructions                                                          |
|-------------------------:|:---------:|:----------------------------------------------------------------------|
|          `app_local_dir` |    No     | Location of the 1Panel Local App Directory (required if not default)  |
|           `git_repo_url` |    Yes    | Appstore Git Repository Address                                       |
|       `git_access_token` |    No     | GitHub Access Token                                                   |
|           `git_username` |    No     | Username for accessing the Git Repository                             |
|           `git_password` |    No     | Password for accessing the Git Repository                             |
|             `git_branch` |    No     | Specify the branch to clone                                           |
|              `git_depth` |    No     | Specify the depth of the clone                                        |
|        `clean_local_app` |    No     | Should the local app directory be cleared before cloning?             |
| `clean_remote_app_cache` |    No     | Should the remote app cache be cleared before cloning?                |
|               `proxyUrl` |    No     | Configure the agent used when cloning or pulling a remote repository  |
|               `work_dir` |    No     | Specify the working directory for cloning the remote Appstore project |
 
### [1Panel Appstore Repositories](#top)

Simply paste the application source address, below, into the `git_repo_url` variable above: 

|                                          Repository | Description                            |
|----------------------------------------------------:|:---------------------------------------|
|              https://github.com/1Panel-dev/appstore | Official 1Panel Appstore Repository    |
|          https://github.com/Ragdata/1panel-appstore | Ragdata's 1Panel Appstore Repository   |
|          https://github.com/qwenode/1panel-appstore | Qwenode's 1Panel Appstore Repository   |
|                  https://github.com/okxlin/appstore | Okxlin's 1Panel Appstore Repository    |
|           https://github.com/maywzh/1panel-appstore | Maywzh's 1Panel Appstore Repository    |
|        https://github.com/arch3rPro/1Panel-Appstore | arch3rPro's 1Panel Appstore Repository |
| https://github.com/xxxily/local-appstore-for-1Panel | 1Panel Appstore Template               |

 [`^ Top`](#top)

## [Resources](#top) 📖

<details>
<summary><strong>More Docker-Compose Collections</strong></summary>

* [Official Docker Compose Samples](https://github.com/docker/awesome-compose)
* [Funky Penguin's Geek Cookbok](https://github.com/geek-cookbook/geek-cookbook) &nbsp;&nbsp; <[Website](https://geek-cookbook.funkypenguin.co.nz/)> &nbsp;&nbsp; <[Premix](https://github.com/geek-cookbook/premix)>
* [Haxxnet's Awesome Docker Compose Examples](https://github.com/Haxxnet/Compose-Examples) &nbsp;&nbsp; <[Website](https://haxxnet.github.io/Compose-Examples/)>
* [Linuxserver.io Images](https://www.linuxserver.io/our-images)
* [Docker Boilerplates](https://github.com/madeofpendletonwool/docker-boilerplates)
* [DockSTARTer](https://github.com/GhostWriters/DockSTARTer)
* [Docker Swarm Rocks](https://dockerswarm.rocks/)
* [Docker Swarm Cookbook](https://github.com/Drauku/docker-swarm-cookbook)
* [Awesome Stacks](https://github.com/ethibox/awesome-stacks)
* [Selfhosted Apps Docker](https://github.com/DoTheEvo/selfhosted-apps-docker)


</details>

### [**Self-Hosting**](https://github.com/docker)

* [Awesome Selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted) &nbsp;&nbsp; <[Website](https://awesome-selfhosted.net/)>
* [The Homelab Wiki](https://thehomelab.wiki/)
* [Mike Royal's Self-Hosting Guide](https://github.com/mikeroyal/Self-Hosting-Guide)
* [Selfh.st](https://selfh.st/)
* [Noted.lol](https://noted.lol)


<br>

[`^ Top`](#top)

## [Security](#top) 🔐

> [!warning]
>If you discover any issue regarding the security of this project, please disclose that information responsibly by sending a [security advisory][advisory].  **PLEASE DO NOT CREATE AN ISSUE OR DISCUSSION TOPIC.**  You can read more about this project's security policies [HERE][security]

While I always good security practices, 100% security can never be guaranteed in any software package.  `1Panel-Appstore` is provided AS IS, and without warranty.  You can find more details in the [LICENSE](LICENSE) file included with this repository.

[`^ Top`](#top)

## [License](#top) ⚖️

<div align="center">

[![MIT][license-badge]][mit-license]

Copyright © 2025 Redeyed Technologies

[_**CLICK HERE FOR THE FULL TEXT OF THIS LICENSE**_][mit-license]

</div>

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

&nbsp;

<div align="center">

<a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Fragdata%2F1panel-appstore" target="_blank"><img alt="Visitors" src="https://api.visitorbadge.io/api/combined?path=https%3A%2F%2Fgithub.com%2Fragdata%2F1panel-appstore&countColor=%23d20000" /></a>
<a href="https://github.com/Ragdata" target="_blank"><img alt="Ragdata" src="https://img.shields.io/badge/-Made_With_☕_By_Ragdata-D20000?style=for-the-badge" /></a>

<h4>

If you like this repository, please give it a ⭐ (it really does help)

<img alt="GitHub repository stars" src="https://img.shields.io/github/stars/ragdata/1panel-appstore?style=social">

</h4>

Copyright &copy; 2025 Redeyed Technologies
</div>

[//]: # (############################################################)

[release]: https://github.com/ragdata/1panel-appstore/releases
<!-- [gh-pages]: https://ragdata.github.io/1panel-appstore/
[repo]: https://github.com/ragdata/1panel-appstore -->

[pre-release]: https://img.shields.io/badge/Status-Pre--Release-d20000?labelColor=31383f
[issues-badge]: https://img.shields.io/github/issues-raw/ragdata/1panel-appstore?style=for-the-badge&logo=github
[license-badge]: https://img.shields.io/badge/License-MIT-gold?style=for-the-badge
[last-commit]: https://img.shields.io/github/last-commit/ragdata/1panel-appstore/master?style=for-the-badge
[version-badge]: https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fragdata%2F1panel-appstore%2Fmaster%2F.releaserc&query=%24.version&prefix=v&label=Version&labelColor=31383f&color=cd4800

[issues]: https://github.com/ragdata/1panel-appstore/issues
[mit-license]: https://choosealicense.com/licenses/mit/

[wakatime-badge]: https://wakatime.com/badge/user/7e04d9d4-3a44-495e-b622-69fdbafd036c/project/57b4a67e-9f5a-412d-996d-80dfb185c607.svg?style=for-the-badge
[wakatime-repo]: https://wakatime.com/badge/user/7e04d9d4-3a44-495e-b622-69fdbafd036c/project/57b4a67e-9f5a-412d-996d-80dfb185c607

[advisory]: https://github.com/ragdata/1panel-appstore/security/advisories/new
[security]: https://github.com/ragdata/1panel-appstore/security/policy

<!-- [all-contributors]: https://allcontributors.org
[contributing]: https://github.com/ragdata/.github/blob/master/.github/CONTRIBUTING.md -->

<!-- [ragdata-repo]: https://github.com/Ragdata -->
