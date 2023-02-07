#!/usr/bin/env sh

set -eu

TARBALL_NAME='tibia.x64.tar.gz'
curl --compressed --location --referer 'https://www.tibia.com/' --output "$TARBALL_NAME" "https://static.tibia.com/download/$TARBALL_NAME"

TIBIA_TAR_GZ_CHECKSUM=$(sha256sum "$TARBALL_NAME" | cut -c '1-64')
sed -E "/TIBIA_TAR_GZ_CHECKSUM/ s/[[:xdigit:]]{64}/$TIBIA_TAR_GZ_CHECKSUM/" -i com.tibia.Tibia.yml
