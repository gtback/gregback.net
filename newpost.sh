#!/bin/bash

# Usage:
# ./newpost.sh This is the Title of the new post

set -euo pipefail

TITLE="$*"
FILENAME="$(echo "$TITLE" | tr "[:upper:]" "[:lower:]" | tr "[:blank:]" "-").md"

echo "$TITLE"
echo "$FILENAME"

cat > "content/${FILENAME}" <<EOF
Title: $TITLE
Date: $(date +"%F %R")
Modified: $(date +"%F %R")
Category:
Authors: Greg Back
Summary:
EOF
