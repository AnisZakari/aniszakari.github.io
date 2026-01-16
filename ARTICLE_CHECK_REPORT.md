# Article Check Report

## Summary
Checked all 60 articles in `_posts/` directory.

## Issues Found

### ✅ Already Fixed
1. **LaTeX syntax** - All WordPress `$latex` syntax has been converted to standard LaTeX `$...$`
2. **Image paths** - All broken image paths have been fixed to use `{{ site.baseurl }}/assets/...`
3. **MathJax support** - Added MathJax 3.0 to layout for LaTeX rendering

### ⚠️ Issues Remaining

#### 1. WordPress HTML Artifacts (ALL 60 articles)
All articles contain WordPress-specific HTML artifacts:
- `<!DOCTYPE html>` declarations in content
- `<html>` and `<body>` tags in content  
- WordPress comment blocks: `<!-- wp:paragraph -->`, `<!-- /wp:paragraph -->`
- WordPress HTML blocks: `<!-- wp:html -->`, `<!-- /wp:html -->`
- Jetpack subscription blocks: `<!-- wp:jetpack/subscriptions -->`

**Impact**: These don't break rendering but add unnecessary HTML and clutter the source.

**Solution**: Run `clean_all_posts.rb` script to remove all WordPress artifacts.

#### 2. WordPress Metadata (All articles)
All articles contain WordPress-specific metadata in front matter:
- `_wpcom_is_markdown`
- `_last_editor_used_jetpack`
- `_publicize_job_id`
- `_elasticsearch_data_sharing_indexed_on`
- etc.

**Impact**: These are harmless but add clutter to front matter.

**Solution**: Optional cleanup - can be removed but not critical.

#### 3. Content Formatting
Some articles have:
- Extra `<br />` tags
- Empty paragraph tags from WordPress
- Jupyter notebook divs (`<div class="cell border-box-sizing...">`)

**Impact**: Minor formatting issues, content still renders.

## Recommendations

1. **Run the cleaning script**: `ruby clean_all_posts.rb` to remove WordPress artifacts
2. **Test locally**: `bundle exec jekyll serve` to verify all articles render correctly
3. **Optional**: Clean up WordPress metadata from front matter if desired

## Articles Status

- **Total articles**: 60
- **Articles with LaTeX**: 3 (all fixed)
- **Articles with images**: ~20 (all fixed)
- **Articles with WordPress artifacts**: 60 (all need cleaning)

## Next Steps

1. Run `clean_all_posts.rb` to clean all articles
2. Test the site locally
3. Deploy to GitHub Pages

