# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin
pkgver=0.39.4
pkgrel=4
pkgdesc="Cursor App - AI-first coding environment"
arch=('x86_64')
url="https://www.cursor.com/"
license=('custom:Proprietary')  # Replace with the correct license if known
depends=('fuse2')
options=(!strip)
source_x86_64=(
    "cursor-${pkgver}.AppImage::https://downloader.cursor.sh/linux/appImage/x64"
    "cursor.png"
)
noextract=("cursor-${pkgver}.AppImage")
sha256sums_x86_64=('0dc735fef1868c0b5eaf3c94d5b7a05953ce7026dcca46e3f464b6c993aa0a6a'
                   'e36f44c1fb0b0f0db14a6f35a1808ca85b5d353fc7c662c0b808a4de79987ea1')

package() {
    install -Dm755 "${srcdir}/cursor-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Symlink executable to be called 'cursor'
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/cursor"

    # Install the icon
    install -Dm644 "${srcdir}/cursor.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cursor.png"

    # Create a .desktop Entry
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/cursor.desktop"
[Desktop Entry]
Name=Cursor
Exec=/usr/bin/cursor --no-sandbox %U
Terminal=false
Type=Application
Icon=cursor
StartupWMClass=cursor-url-handler
X-AppImage-Version=${pkgver}
MimeType=x-scheme-handler/cursor;
Categories=Utility;
EOF
}

post_install() {
    update-desktop-database -q
    xdg-icon-resource forceupdate
}
