#!/bin/bash
REPOSITORY=polyverse/readhook
ASSET_NAME=readhook.so
RELEASE_TAG=$1

if [[ "$RELEASE_TAG" == "" ]]; then
	RELEASE_TAG=jenkins
fi

# Delete the current asset (if it exists)
asset_id_from_release_tag_and_name=$(pv github asset-id-from-release-tag-and-name $REPOSITORY $RELEASE_TAG $ASSET_NAME)
printf "asset-id-from-release-tag-and-name:\n$asset_id_from_release_tag_and_name\n"

delete_release_asset=$(pv github delete-release-asset $REPOSITORY $asset_id_from_release_tag_and_name)
printf "delete-release-asset:\n$delete_release_asset\n"

upload_release_file_by_tag=$(pv github upload-release-file-by-tag $REPOSITORY $RELEASE_TAG $ASSET_NAME)
printf "upload-release-file-by-tag:\n$upload_release_file_by_tag\n"