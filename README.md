# overlay
Personal gentoo ebuild repository. Some fixes for musl.

## Maintained
* media-sound/bitwig-studio: Modern music production and performance for Windows, macOS, and Linux.

## No Longer Maintained
* net-p2p/monero: musl fix
* net-misc/xmrig-mo: ([moved to GURU](https://gitweb.gentoo.org/repo/proj/guru.git/tree/net-misc/xmrig-mo)) Monero Ocean's fork of xmrig (supports algo switching), OpenCL support
* dev-libs/libixion: musl fix
* dev-qt/qtwebengine: based on [12101111-overlay's](https://github.com/12101111/overlay) musl version, with an added fix for an error I was running into on musl: `named_platform_channel_posix.cc:53:3: error: 'strncpy' was not declared in this scope`
* dev-qt/qtcore: musl fix
