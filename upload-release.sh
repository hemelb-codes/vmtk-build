#!/bin/bash
# File(s) to upload as args to this script

set -e
set -x
set -u

RELEASE_ID=$(jq --raw-output '.release.id' "$GITHUB_EVENT_PATH")


for file in "$@"; do
    base=$(basename "${file}")

    http_stat=$(
	curl \
	    -sSL \
	    -X POST \
	    -H "Accept: application/vnd.github.v3+json" \
	    -H "Authorization: token ${GITHUB_TOKEN}" \
	    -H "Content-Type:application/octet-stream" \
	    -T "${file}" \
	    -o "${base}.curlout" \
	    -w "%{http_code}" \
	    "https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}/assets?name=${base}"
	)
    rc=$?

    if [ $rc -ne 0 ]; then
	echo "curl error"
	exit 1
    fi

    if [ http_stat -ge 400 ]; then
	echo "Upload failed: ${http_stat}"
	exit 1
    fi

    # pretty print response
    jq . < "${base}.curlout"
done
