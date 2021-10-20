# overlay
Personal gentoo ebuild repository. Some fixes for musl.

* net-p2p/monero: musl fix
* net-misc/xmrig-mo: Monero Ocean's fork of xmrig (supports algo switching), OpenCL support
* dev-libs/libixion: musl fix
* dev-qt/qtwebengine: based on [12101111-overlay's](https://github.com/12101111/overlay) musl version, with an added fix for an error I was running into on musl: `named_platform_channel_posix.cc:53:3: error: 'strncpy' was not declared in this scope`
