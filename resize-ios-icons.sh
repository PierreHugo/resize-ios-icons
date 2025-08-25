#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 image.png"
  exit 1
fi
 
SRC="$1"

# is ImageMagick installed?
if ! command -v magick &> /dev/null; then
  echo "Erreur : ImageMagick 7 (magick) n'est pas installé."
  exit 1
fi

SIZES=(40 60 58 87 76 114 80 120 180 128 192 136 152 167)

BASENAME=$(basename "$SRC" .png)

mkdir -p resized

cp "$SRC" "resized_${BASENAME}/${BASENAME}_1024.png"

for SIZE in "${SIZES[@]}"; do
  magick "$SRC" -resize "${SIZE}x${SIZE}" "resized/${BASENAME}_${SIZE}.png"
  echo "Généré : resized/${BASENAME}_${SIZE}.png"
done

echo "✅ COMPLETED. Assets available in ./resized/"
