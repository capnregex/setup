#!/bin/bash

. latest.sh
. token.sh
. ghe.sh

read -r -d '' json <<JSON
{
  "tag_name": "$now",
  "target_commitish": "master",
  "name": "$now",
  "body": "Release of version $now",
  "draft": false,
  "prerelease": false
}
JSON

# curl -s -H "Authorization: token $TOKEN" --data "$json" $releases > new_release.json
# curl -s -H "Authorization: token $TOKEN" $releases > tee releases.json
curl -s -H "Authorization: token $TOKEN" $releases/tags/$now > tee release.json
release=$(jq -r .url release.json)
echo $release

mime_type=$(file -b --mime-type $box_file)

curl -H "Authorization: token $TOKEN" \
     -H "Content-Type: $mime_type" \
     --data-binary @$box_file \
     "$release/assets?name=$box_name.box"

