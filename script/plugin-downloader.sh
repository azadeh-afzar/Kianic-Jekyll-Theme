#!/usr/bin/env bash

CURRDIR="$PWD"
PLUGINDIR="${PWD%/*}/assets/plugins"
TEMPDIR="temp"

# Create a temporary directory.
mkdir -p $TEMPDIR

# Reset plugin directory.
rm -rf "$PLUGINDIR" && mkdir -p "$PLUGINDIR"

# First plugin: Kianic Flag Icons.
KIANIC_FLAG_ICONS=$(curl -s https://api.github.com/repos/azadeh-afzar/Kianic-Flag-Icons/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/azadeh-afzar/Kianic-Flag-Icons/archive/" substr($2, 2, length($2)-3) ".tar.gz"}') \
# Setup paths.
KFI_DIRECROTY="kiaflagcons"
KFI_IN_TEMP="$( echo "$TEMPDIR/"*"/$KFI_DIRECROTY" )"
# Create directory for this plugin in plugins directory.
mkdir -p "$PLUGINDIR/$KFI_DIRECROTY"
# Download and extract.
curl -L $KIANIC_FLAG_ICONS | tar -xz --directory $TEMPDIR
# Copy from temporary directory to plugin directory.
mv $KFI_IN_TEMP/* "$PLUGINDIR/$KFI_DIRECROTY"


# Second plugin: Kianic Simple Icons.
KIANIC_SIMPLE_ICONS=$(curl -s https://api.github.com/repos/azadeh-afzar/Kianic-Simple-Icons/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/azadeh-afzar/Kianic-Simple-Icons/archive/" substr($2, 2, length($2)-3) ".tar.gz"}') \
# Setup paths.
KSI_DIRECROTY="kiasimcons"
KSI_IN_TEMP="$( echo "$TEMPDIR/"*"/$KSI_DIRECROTY" )"
# Create directory for this plugin in plugins directory.
mkdir -p "$PLUGINDIR/$KSI_DIRECROTY"
# Download and extract.
curl -L $KIANIC_SIMPLE_ICONS | tar -xz --directory $TEMPDIR
# Copy from temporary directory to plugin directory.
mv $KSI_IN_TEMP/* "$PLUGINDIR/$KSI_DIRECROTY"

# Delete temporary folder.
rm -rf $TEMPDIR
