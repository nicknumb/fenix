PKG_NAME="kodi_aml"
PKG_VERSION="58348bd09f8acd9b9256b824c0fd3e9d4fd56fc8"
PKG_SHA256="de8c586c87ed453a37ac189ea095ef48ee3086dbfdbffd6e4c85d7c340f29153"
PKG_SOURCE_DIR="kodi_aml-${PKG_VERSION}*"
PKG_SITE="https://github.com/numbqq/kodi_aml"
PKG_URL="https://github.com/numbqq/kodi_aml/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SHORTDESC="Amlogic Kodi package"
PKG_SOURCE_NAME="kodi_aml-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="YES"


make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi/*
	cp ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/*.deb $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	if [ -d ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/deps ]; then
		cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/deps $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	fi
	if [ -d ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/dev ]; then
		cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/dev $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	fi

	debs=$(ls $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi/deps/*.deb)
	for deb in $debs
	do
		echo $deb
	done
}
