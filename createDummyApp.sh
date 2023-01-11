#!/bin/zsh

# This script creates a dummy app with the given name and bundle identifier.
printf "Name: "
read PRODUCT_NAME
printf "BundleID: "
read PRODUCT_BUNDLE_IDENTIFIER
printf "Version: "
read VERSION

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)

cp -r $SCRIPT_DIR/* $TMP_DIR
cd $TMP_DIR
$TMP_DIR/rename.swift dummy "$PRODUCT_NAME"

agvtool new-version -all $VERSION

xcodebuild -project "$TMP_DIR/$PRODUCT_NAME.xcodeproj" PRODUCT_BUNDLE_IDENTIFIER=$PRODUCT_BUNDLE_IDENTIFIER -archivePath "$TMP_DIR/$PRODUCT_NAME.xcarchive" -scheme $PRODUCT_NAME archive
xcodebuild -exportArchive -archivePath "$TMP_DIR/$PRODUCT_NAME.xcarchive" -exportPath "$SCRIPT_DIR" -exportOptionsPlist "$TMP_DIR/exportOptions.plist"

#xcodebuild -exportArchive -exportFormat app -archivePath "$TMP_DIR/$PRODUCT_NAME.xcarchive" -exportPath "$PRODUCT_NAME.app" -exportSigningIdentity "Developer ID Application: My Software Company"

#open $TMP_DIR
rm -rf $TMP_DIR
