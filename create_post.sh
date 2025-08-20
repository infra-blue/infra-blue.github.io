#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <category> <title>"
    exit 1
fi

CATEGORY=$1
TITLE=$2

case "$CATEGORY" in
    "blog"|"ctf"|"resources"|"writeups"|"projects")
        ;;
    *)
        echo "Error: Invalid category '$CATEGORY'."
        echo "Allowed categories are: blog, ctf, resources, writeups, projects."
        exit 1
        ;;
esac

FILE_DATE=$(date +%Y-%m-%d)
POST_DATE=$(date +%Y-%m-%dT%H:%M:%S%:z)

FILENAME_TITLE=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/--\+/-/g' -e 's/^-//' -e 's/-$//')
FILE_PATH="_posts/$CATEGORY/$FILE_DATE-$CATEGORY-$FILENAME_TITLE.md"

#TEMPLATE
POST_CONTENT="---
title: \"${CATEGORY^^}: $TITLE\"
date: $POST_DATE
categories:
  - $CATEGORY
tags:
  - 
---
"

echo "$POST_CONTENT" > "$FILE_PATH"

echo "Post created successfully at: $FILE_PATH"

exit 0
