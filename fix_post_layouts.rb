#!/usr/bin/env ruby

require 'fileutils'

posts_dir = File.join(__dir__, '_posts')
fixed_count = 0

Dir.glob(File.join(posts_dir, '*.html')).each do |file|
  content = File.read(file)
  original_content = content.dup
  
  # Replace layout: post with layout: single
  content.gsub!(/^layout: post$/, 'layout: single')
  
  if content != original_content
    File.write(file, content)
    fixed_count += 1
    puts "Fixed: #{File.basename(file)}"
  end
end

puts "\n✅ Fixed #{fixed_count} post(s)!"

