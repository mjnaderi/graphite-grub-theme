#!/bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

INDEX="backgrounds.txt"

if [[ "$1" == "1080p" ]]; then
  BACKGROUNDS_DIR="1080p"
  EXPORT_DPI="96"
  SRC_FILE="backgrounds.svg"
elif [[ "$1" == "2k" ]]; then
  BACKGROUNDS_DIR="2k"
  EXPORT_DPI="144"
  SRC_FILE="backgrounds.svg"
elif [[ "$1" == "4k" ]]; then
  BACKGROUNDS_DIR="4k"
  EXPORT_DPI="192"
  SRC_FILE="backgrounds.svg"
elif [[ "$1" == "3200x2000" ]]; then
  BACKGROUNDS_DIR="3200x2000"
  EXPORT_DPI="177.7778"
  SRC_FILE="backgrounds-16-10.svg"
else
  echo "Please use either '1080p', '2k', '4k' or '3200x2000'"
  exit 1
fi

install -d "$BACKGROUNDS_DIR"

while read -r i; do
  if [[ -f "$BACKGROUNDS_DIR/$i.png" ]]; then
    echo "$BACKGROUNDS_DIR/$i.png exists"
  elif [[ "$i" == "" ]]; then
    continue
  else
    echo -e "\nRendering $BACKGROUNDS_DIR/$i.png"
    $INKSCAPE "--export-id=$i" \
              "--export-dpi=$EXPORT_DPI" \
              "--export-id-only" \
              "--export-filename=$BACKGROUNDS_DIR/$i.png" "$SRC_FILE" >/dev/null
    $OPTIPNG -strip all -nc "$BACKGROUNDS_DIR/$i.png"
  fi
done < "$INDEX"

exit 0
