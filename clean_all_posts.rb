#!/usr/bin/env ruby

require 'fileutils'

posts_dir = File.join(__dir__, '_posts')
cleaned_count = 0

Dir.glob(File.join(posts_dir, '*.html')).each do |file|
  content = File.read(file)
  original_content = content.dup
  
  # Split front matter from content
  if content.start_with?('---')
    parts = content.split('---', 3)
    if parts.length >= 3
      front_matter = parts[1]
      body = parts[2]
      
      # Clean the body content
      # Remove WordPress comment blocks
      body.gsub!(/<!-- wp:[^\>]* -->/, '')
      body.gsub!(/<!-- \/wp:[^\>]* -->/, '')
      
      # Remove DOCTYPE and HTML wrapper tags
      body.gsub!(/<!DOCTYPE[^>]*>/i, '')
      body.gsub!(/&lt;!DOCTYPE[^&]*&gt;/i, '')
      body.gsub!(/<html[^>]*>/i, '')
      body.gsub!(/&lt;html[^&]*&gt;/i, '')
      body.gsub!(/<\/html>/i, '')
      body.gsub!(/&lt;\/html&gt;/i, '')
      body.gsub!(/<body[^>]*>/i, '')
      body.gsub!(/&lt;body[^&]*&gt;/i, '')
      body.gsub!(/<\/body>/i, '')
      body.gsub!(/&lt;\/body&gt;/i, '')
      
      # Remove paragraph tags wrapping DOCTYPE/HTML
      body.gsub!(/<p><!DOCTYPE[^<]*<\/p>/i, '')
      body.gsub!(/<p>&lt;!DOCTYPE[^<]*<\/p>/i, '')
      body.gsub!(/<p><!-- wp:html --><html><body><\/p>/i, '')
      body.gsub!(/<p><!-- \/wp:html --><br \/>\s*<\/body><\/html><\/p>/i, '')
      body.gsub!(/<p><!-- \/wp:html --><br \/>/i, '')
      body.gsub!(/<p><!DOCTYPE html PUBLIC[^<]*<br \/><\/p>/i, '')
      
      # Remove trailing artifacts
      body.gsub!(/<\/body><\/html>\s*$/i, '')
      body.gsub!(/&lt;\/body&gt;&lt;\/html&gt;\s*$/i, '')
      body.gsub!(/<br \/>\s*<\/body><\/html><\/p>\s*$/i, '')
      
      # Clean up empty paragraph tags left by WordPress
      body.gsub!(/<p><!-- wp:paragraph --><\/p>/i, '')
      body.gsub!(/<p><!-- \/wp:paragraph --><\/p>/i, '')
      body.gsub!(/<p><!-- wp:paragraph --><br \/><\/p>/i, '')
      
      # Remove WordPress jetpack blocks
      body.gsub!(/<!-- wp:jetpack\/[^>]* -->/, '')
      body.gsub!(/<!-- \/wp:jetpack\/[^>]* -->/, '')
      
      # Clean up excessive line breaks but preserve paragraph spacing
      body.gsub!(/\n{4,}/, "\n\n\n")
      
      # Reconstruct the file
      content = "---#{front_matter}---#{body}"
    end
  end
  
  # Only write if content changed
  if content != original_content
    File.write(file, content)
    cleaned_count += 1
    puts "✅ Cleaned: #{File.basename(file)}"
  end
end

puts "\n✨ Cleaned #{cleaned_count} article(s) out of #{Dir.glob(File.join(posts_dir, '*.html')).length} total!"

