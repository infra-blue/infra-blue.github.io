category=$1
title=$2
today=$(date +"%Y-%m-%d")
slug=$(echo "$title" | sed -e "s/ /-/g" | tr '[:upper:]' '[:lower:]')
filename="_posts/$category/$today-$slug.md"

cat << EOF > "$filename"
---
layout: post
title: "$title"
date: $today
categories: $category
---

<!-- Post content goes here -->

EOFtoday=$(date +"%Y-%m-%d %H:%M:%S %z")


echo "Created post template: $filename"
