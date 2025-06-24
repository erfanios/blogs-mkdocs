#!/usr/bin/env bash
# SCRIPT: generate-toc.sh 
# AUTHOR: ...
# DATE: 2025-06-24T02:56:00
# REV: 1.0
# ARGUMENTS: [1:        ][2:		][3:		][4:        ]
#
# PURPOSE: Adds table of content to the index.md 
#
# set -x # Uncomment to debug
# set -n # Uncomment to check script syntax without execution
# set -e # Break on the first failure

#!/bin/bash

DOCS_DIR="docs"
INDEX_FILE="index.md"

cd "$DOCS_DIR" || { echo "Fehler: $DOCS_DIR existiert nicht."; exit 1; }

> "$INDEX_FILE"
#echo "# Table of contents - Inhaltsverzeichnis" > "$INDEX_FILE"
# echo "" >> "$INDEX_FILE"

find . -type d | sort | while read dir; do
  if [ "$dir" != "." ]; then
    rel_dir="${dir#./}"
    echo "## [    ${rel_dir}    ]" >> "$INDEX_FILE"
    echo "" >> "$INDEX_FILE"
  fi

  find "$dir" -maxdepth 1 -type f -name '*.md' ! -name 'index.md' | sort | while read filepath; do
    relpath="${filepath#./}"         # relativer Pfad inkl. Unterordner, z.B. git/rename-commit-author.md
    filename="$(basename "$relpath" .md)"

    title=$(grep -m1 '^# ' "$filepath" | sed 's/^# //')
    [ -z "$title" ] && title="$filename"

    # Link ohne Dateiendung, mit Pfad
    echo "- [$title](${relpath%.md})" >> "$INDEX_FILE"
  done

  echo "" >> "$INDEX_FILE"
done

echo "✅ Inhaltsverzeichnis in $DOCS_DIR/$INDEX_FILE erzeugt."

