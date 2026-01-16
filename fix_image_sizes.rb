#!/usr/bin/env ruby

# Fix image sizes in a specific post
post_file = File.join(__dir__, '_posts', '2022-12-16-understanding-projections-they-are-all-over-the-place-in-machine-learning.html')

content = File.read(post_file)

# Remove WordPress query parameters from image URLs
content.gsub!(/(src="[^"]*)\?[hw]=\d+(")/, '\1\2')

# Fix height attributes - remove 'px' suffix and convert to proper format
# HTML height attribute should be just a number, but we'll use style instead for better control
content.gsub!(/height="(\d+)px"/) do |match|
  height = $1
  # Keep the height attribute but also add inline style for better control
  "height=\"#{height}\" style=\"max-height: #{height}px; width: auto;\""
end

# Fix cases where height doesn't have px
content.gsub!(/height="(\d+)"/) do |match|
  height = $1
  "height=\"#{height}\" style=\"max-height: #{height}px; width: auto;\""
end

File.write(post_file, content)
puts "✅ Fixed image sizes in: #{File.basename(post_file)}"

