#!/bin/sh
echo "["
curl https://api.github.com/users/dragonfireclient/repos |jq '.[] | .full_name'|tr -d '"' |while read l; do
	name=$(echo $l|cut -d '/' -f2)
	title=$(echo $l|cut -d '/' -f2)
	author=$(echo $l|cut -d '/' -f1)
	echo "
	{
	\"name\": \"${name}\",
	\"title\": \"${title}\",
	\"author\": \"${author}\",
	\"download_url\": \"https://github.com/dragonfireclient/${name}/archive/refs/heads/master.zip\",
	\"raw_deps\": \"\",
	\"type\": \"mod\",
	\"release\": 1
	},"
done

echo "]"
