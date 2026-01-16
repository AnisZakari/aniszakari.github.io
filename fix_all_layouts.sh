#!/bin/bash
# Fix all post layouts from 'post' to 'single' for Minimal Mistakes theme

cd "$(dirname "$0")/_posts"

for file in *.html; do
  if [ -f "$file" ]; then
    # Use sed to replace layout: post with layout: single
    sed -i '' 's/^layout: post$/layout: single/' "$file"
    echo "Fixed: $file"
  fi
done

echo "✅ All posts updated!"

