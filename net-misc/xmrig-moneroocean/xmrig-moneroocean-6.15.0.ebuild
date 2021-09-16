# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="MoneroOcean fork of xmrig that supports algo switching"
HOMEPAGE="https://github.com/MoneroOcean/xmrig"

S=${WORKDIR}/xmrig-${PV}-mo1

if [[ ${PV} == *9999 ]] ; then
	EGIT_REPO_URI="https://github.com/MoneroOcean/xmrig.git"
	inherit git-r3
else
	SRC_URI="https://github.com/MoneroOcean/xmrig/archive/v${PV}-mo1.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
fi

LICENSE="Apache-2.0 GPL-3+ MIT"
SLOT="0"
IUSE="cpu_flags_x86_sse4_1 donate hwloc +ssl"

DEPEND="
	dev-libs/libuv:=
	hwloc? ( sys-apps/hwloc:= )
	ssl? ( dev-libs/openssl:= )
"
RDEPEND="
	${DEPEND}
	!arm64? ( sys-apps/msr-tools )
"

src_prepare() {
	if ! use donate ; then
		sed -i 's/1;/0;/g' src/donate.h || die
	fi

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_SSE4_1=$(usex cpu_flags_x86_sse4_1)
		-DWITH_HWLOC=$(usex hwloc)
		-DWITH_TLS=$(usex ssl)
		-DWITH_CUDA=OFF
	)

	cmake_src_configure
}

src_install() {
	default
	newbin "${BUILD_DIR}/xmrig" xmrig-moneroocean
}

