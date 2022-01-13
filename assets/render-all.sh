#!/bin/bash

THEMES=("logos" "assets")
RESOLUTIONS=("1080p" "2k" "4k" "3200x2000")

for theme in "${THEMES[@]}"; do
  for resolution in "${RESOLUTIONS[@]}"; do
    echo "./render-core.sh \"$theme\" \"$resolution\": "
    ./render-core.sh "$theme" "$resolution"
  done
done

exit 0
