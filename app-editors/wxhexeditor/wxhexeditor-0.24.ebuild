# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
WX_GTK_VER=3.0-gtk3

inherit toolchain-funcs wxwidgets

MY_PN="wxHexEditor"

DESCRIPTION="A cross-platform hex editor designed specially for large files"
HOMEPAGE="http://www.wxhexeditor.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-v${PV}-src.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-crypt/mhash
	dev-libs/udis86
	x11-libs/wxGTK:${WX_GTK_VER}[X]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"

PATCHES=(
	"${FILESDIR}"/${P}-syslibs.patch
)

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && tc-check-openmp
}

src_prepare() {
	setup-wxwidgets
	default
}
