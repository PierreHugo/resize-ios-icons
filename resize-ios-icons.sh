#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 image.png"
  exit 1
fi

SRC="$1"

# Check if ImageMagick is installed
if ! command -v magick &> /dev/null; then
  echo "Error: ImageMagick 7 (magick) is not installed."
  exit 1
fi

# Icon sizes to generate
SIZES=(40 60 58 87 76 114 80 120 180 128 192 136 152 167)

# Base name of the file (without extension)
BASENAME=$(basename "$SRC" .png)

# Output folder named after the file
OUTDIR="resized_${BASENAME}"
mkdir -p "$OUTDIR"

# Copy original 1024 image
cp "$SRC" "${OUTDIR}/${BASENAME}_1024.png"

# Generate all other sizes
for SIZE in "${SIZES[@]}"; do
  magick "$SRC" -resize "${SIZE}x${SIZE}" "${OUTDIR}/${BASENAME}_${SIZE}.png"
  echo "Generated: ${OUTDIR}/${BASENAME}_${SIZE}.png"
done

echo "✅ COMPLETED. Assets available in ./${OUTDIR}/"
