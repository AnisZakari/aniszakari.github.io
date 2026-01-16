# Quick Fix for Theme

The theme is broken because all posts use `layout: post` but Minimal Mistakes uses `layout: single`.

## To Fix:

Run this command in your terminal:

```bash
cd /Users/aniszakari/Documents/personal-blog
ruby fix_post_layouts.rb
```

Or manually fix by running:

```bash
find _posts -name "*.html" -exec sed -i '' 's/^layout: post$/layout: single/' {} \;
```

This will update all 58 remaining posts to use the correct layout.

## What's Already Fixed:

✅ Created `index.html` homepage
✅ Updated `_config.yml` for Minimal Mistakes
✅ Fixed 2 posts manually
✅ Created fix script

## After Running the Fix:

1. Restart Jekyll: `bundle exec jekyll serve`
2. The theme should now work properly!

