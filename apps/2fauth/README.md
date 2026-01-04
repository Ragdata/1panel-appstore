# [2FAuth](https://github.com/Bubka/2FAuth)

<div align="center">

### _A web app to manage your Two-Factor Authentication (2FA) accounts_

![][docker-pulls-badge] ![][docker-size-badge] ![][docker-version-badge] ![][github-issues-badge] ![][github-last-commit-badge]

![][github-stars-badge]

</div>

## [Overview](#top) 🚩

2FAuth is a web based self-hosted alternative to One Time Passcode (OTP) generators like Google Authenticator, designed for both mobile and desktop.  It aims to ease you perform your 2FA authentication steps whatever the device you handle, with a clean and suitable interface.

![](https://cdn.jsdelivr.net/gh/Ragdata/1panel-appstore/apps/2fauth/screenshot.png)

> [2FAuth Demo](https://demo.2fauth.app/)
> 
> Credentials: 
> 	username: demo@2fauth.app
> 	password: demo

[`^ Top`](#top)

## [Features](#top) ✨

- Manage your 2FA accounts and organize them using Groups
- Scan and decode any QR code to add account in no time
- Add custom account without QR code thanks to an advanced form
- Edit accounts, even the imported ones
- Generate TOTP and HOTP security codes and Steam Guard codes

### [Security Features](#top)

2FAuth provides several security mechanisms to protect your sensitive data:

#### [Single User App](#top)

You have to create a user account and authenticate yourself to use the app.  It is not possible to create more than one user account - the app is intended for personal use only.

#### [Modern Authentication](#top)

You can sign in to 2FAuth using a security key (Yubikey or Titan) and disable the traditional login form.

#### [Data Encryption](#top)

Sensitive data stored in the database can be encrypted to protect them against db compromise. Encryption is provided as an option which is disabled by default. It is strongly recommended to backup the `APP_KEY` value of your `.env` file (or the whole file) when encryption is On.

#### [Auto Logout](#top)

2FAuth automatically log you out after an inactivity period to prevent long life session. The auto logout can be deactivated or triggered when a security code is copied.

#### [RFC Compliance](#top)

2FAuth generates OTP according to RFC 4226 (HOTP Algorithm) and RFC 6238 (TOTP Algorithm)

[`^ Top`](#top)

## [License](#top) ⚖️

[![][github-license-badge]][license-link]

[`^ Top`](#top)

[docker-pulls-badge]: https://img.shields.io/docker/pulls/2fauth/2fauth?labelColor=31383f
[docker-size-badge]: https://img.shields.io/docker/image-size/2fauth/2fauth?labelColor=31383f
[docker-stars-badge]: https://img.shields.io/docker/stars/2fauth/2fauth?style=social
[docker-version-badge]: https://img.shields.io/docker/v/2fauth/2fauth?labelColor=31383f
[github-issues-badge]: https://img.shields.io/github/issues/Bubka/2FAuth?labelColor=31383f
[github-last-commit-badge]: https://img.shields.io/github/last-commit/Bubka/2FAuth?labelColor=31383f
[github-stars-badge]: https://img.shields.io/github/stars/Bubka/2FAuth
[github-license-badge]: https://img.shields.io/badge/License-AGPLv3-blue?labelColor=31383f

[license-link]: https://choosealicense.com/licenses/agpl-3.0/
