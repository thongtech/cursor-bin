pkgname=cursor-bin
_pkgname=cursor
pkgver=0.42.0
pkgrel=1
pkgdesc="Cursor App - AI-first coding environment"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')

source=("${_pkgname}-${pkgver}-x86_64.AppImage::https://downloader.cursor.sh/linux/appImage/x64"
        "${_pkgname}.sh")
sha512sums=('SKIP'
            'ff0837ca96b4b11d17484f4c70ab41bb7caebb7e9e7b0e14ed844284126695961eac2b1303c4d81d63c33fccef2777b0790810f9bc99aebf1a62e8701a9d99a1')

prepare() {
    # Extract AppImage
    echo "Extracting AppImage..."
    chmod +x "${_pkgname}-${pkgver}-x86_64.AppImage"
    ./"${_pkgname}-${pkgver}-x86_64.AppImage" --appimage-extract &> /dev/null
}

package() {
    # Copy package files
    echo "Copying package files..."
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -Lr "${srcdir}/squashfs-root" "${pkgdir}/opt/${_pkgname}"
    # Set perms
    chmod a+rx "${pkgdir}/opt/${_pkgname}/" -R

    # Add package to /usr/bin/
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm 755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Copy .desktop file
    mkdir -p "${pkgdir}/usr/share/applications"
    cp -Lr "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    
    sed -i 's|^Exec=AppRun --no-sandbox %U|Exec='"$_pkgname"' --no-sandbox %U|' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i 's/StartupWMClass=Cursor/StartupWMClass=cursor-url-handler/g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Copy icons
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/"{128x128,256x256,512x512}"/apps/"
    for i in 128x128 256x256 512x512; do
        cp -Lr "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/"
    done
}
