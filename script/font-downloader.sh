#!/usr/bin/env bash

# Exit immediatley if a command failed
set -e

CURRDIR="$PWD"
FONTDIR="${PWD%/*}/assets/fonts"
TEMPDIR="temp"
DIST="dist"

# Create a temporary directory.
mkdir -p $TEMPDIR

# Reset plugin directory.
rm -rf "$FONTDIR" && mkdir -p "$FONTDIR"

# First font: Vazir.
# Get latest version.
VAZIR_VERSION=$(curl -s https://api.github.com/repos/rastikerdar/vazir-font/releases/latest \
| grep "tag_name" \
| awk '{print "" substr($2, 2, length($2)-3)}') \
# Create download link.
VAZIR_FONT="https://github.com/rastikerdar/vazir-font/archive/$VAZIR_VERSION.tar.gz"
# Setup paths.
VAZIR_DIRECROTY="Vazir"
VAZIR_TARGZ="vazir-font.tar.gz"
VAZIR_IN_TEMP="vazir-font-${VAZIR_VERSION:1}"
# Create directory for this font in fonts directory.
mkdir -p "$FONTDIR/$VAZIR_DIRECROTY"
# Download and extract.
curl -L "$VAZIR_FONT" > "$VAZIR_TARGZ"
tar -xz --file "$VAZIR_TARGZ" --directory "./$TEMPDIR"
# Remove tar file.
rm "$VAZIR_TARGZ"

# Go to directory
cd $TEMPDIR
cd $VAZIR_IN_TEMP
cd $DIST

# For filename in this directory; do
for filename in *; do # Look for files in extracted folder.
  # This syntax emits the value in lowercase: ${var,,*}  (bash version 4)
  case "${filename,,*}" in
    # Excludes files from being moved.
     *.eot) : ;; 
    # Move fonts.
     vazir*) mv "$filename" "$FONTDIR/$VAZIR_DIRECROTY" ;;
  esac
done

# Get back to script directory.
cd ../../..

# Second font: Vazir-Code.
# Get latest version.
VAZIR_CODE_VERSION=$(curl -s https://api.github.com/repos/rastikerdar/vazir-code-font/releases/latest \
| grep "tag_name" \
| awk '{print "" substr($2, 2, length($2)-3)}') \
# Create download link.
VAZIR_CODE_FONT="https://github.com/rastikerdar/vazir-code-font/archive/$VAZIR_CODE_VERSION.tar.gz"
# Setup paths.
VAZIR_CODE_DIRECROTY="Vazir-Code"
VAZIR_CODE_TARGZ="vazir-code-font.tar.gz"
VAZIR_CODE_IN_TEMP="vazir-code-font-${VAZIR_CODE_VERSION:1}"
# Create directory for this font in fonts directory.
mkdir -p "$FONTDIR/$VAZIR_CODE_DIRECROTY"
# Download and extract.
curl -L "$VAZIR_CODE_FONT" > "$VAZIR_CODE_TARGZ"
tar -xz --file "$VAZIR_CODE_TARGZ" --directory "./$TEMPDIR"
# Remove tar file.
rm "$VAZIR_CODE_TARGZ"

# Go to directory
cd $TEMPDIR
cd $VAZIR_CODE_IN_TEMP
cd $DIST

# For filename in this directory; do
for filename in *; do # Look for files in extracted folder.
  # This syntax emits the value in lowercase: ${var,,*}  (bash version 4)
  case "${filename,,*}" in
    # Excludes files from being moved.
     *.eot) : ;; 
    # Move fonts.
     vazir*) mv "$filename" "$FONTDIR/$VAZIR_CODE_DIRECROTY" ;;
  esac
done

# Get back to script directory.
cd ../../..

# Third font: Sahel.
# Get latest version.
SAHEL_VERSION=$(curl -s https://api.github.com/repos/rastikerdar/sahel-font/releases/latest \
| grep "tag_name" \
| awk '{print "" substr($2, 2, length($2)-3)}') \
# Create download link.
SAHEL_FONT="https://github.com/rastikerdar/sahel-font/archive/$SAHEL_VERSION.tar.gz"
# Setup paths.
SAHEL_DIRECROTY="Sahel"
SAHEL_TARGZ="sahel-font.tar.gz"
SAHEL_IN_TEMP="sahel-font-${SAHEL_VERSION:1}"
# Create directory for this font in fonts directory.
mkdir -p "$FONTDIR/$SAHEL_DIRECROTY"
# Download and extract.
curl -L "$SAHEL_FONT" > "$SAHEL_TARGZ"
tar -xz --file "$SAHEL_TARGZ" --directory "./$TEMPDIR"
# Remove tar file.
rm "$SAHEL_TARGZ"

# Go to directory
cd $TEMPDIR
cd $SAHEL_IN_TEMP
cd $DIST

# For filename in this directory; do
for filename in *; do # Look for files in extracted folder.
  # This syntax emits the value in lowercase: ${var,,*}  (bash version 4)
  case "${filename,,*}" in
    # Excludes files from being moved.
     *.eot) : ;; 
    # Move fonts.
     sahel*) mv "$filename" "$FONTDIR/$SAHEL_DIRECROTY" ;;
  esac
done

# Get back to script directory.
cd ../../..

# Delete temporary folder.
rm -rf $TEMPDIR
