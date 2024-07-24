# Maintainer: Your Name <your.email@example.com>

pkgname=cursor-bin
pkgver=0.38.0  # Updated to the latest version
pkgrel=1
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
sha256sums_x86_64=('41ca61e94611f95b6569836a1c9a48184547bb5abc55b7ef9b906feacc1ffa93'
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
Comment=Cursor is an AI-first coding environment.
Exec=/usr/bin/cursor
Terminal=false
Type=Application
Icon=cursor
StartupWMClass=Cursor
X-AppImage-Version=${pkgver}
MimeType=x-scheme-handler/cursor;
Categories=Utility;
EOF
}

post_install() {
    update-desktop-database -q
    xdg-icon-resource forceupdate
}

# Instructions for updating the package:
# 1. Update the pkgver to the latest version.
# 2. Run `updpkgsums` to update the checksums.
# 3. Run `makepkg --printsrcinfo > .SRCINFO` to update the .SRCINFO file.
