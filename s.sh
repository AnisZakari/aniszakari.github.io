#!/bin/bash
# Fix nokogiri architecture issue (x86_64 -> arm64)
# Uninstall the x86_64 version
sudo gem uninstall nokogiri -v 1.13.10 -x

# Install nokogiri for ARM64 (will build from source if needed)
# Note: This may require Xcode command line tools: xcode-select --install
sudo gem install nokogiri -v 1.13.10 --platform=ruby

# Run the import
jekyll-import wordpressdotcom --source /Users/aniszakari/Documents/personal-blog/assets/scaleupyourknowledgeindatascience.WordPress.2026-01-16.xml  --assets_folder /Users/aniszakari/Documents/personal-blog/assets/media-export-203664368-from-0-to-2031
