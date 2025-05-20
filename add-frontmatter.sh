#!/bin/bash

# Navigate to your Vue docs directory
cd src/content/docs/vue

# Find all .md and .mdx files without frontmatter and add basic frontmatter
find . -type f \( -name "*.md" -o -name "*.mdx" \) | while read file; do
  # Extract filename without extension for the title
  filename=$(basename "$file" | sed 's/\.[^.]*$//')
  
  # Convert kebab-case to Title Case
  title=$(echo "$filename" | sed -r 's/(^|-)([a-z])/\U\2/g' | sed 's/-/ /g')
  
  # Check if file already has frontmatter
  if ! grep -q "^---" "$file"; then
    # Create temporary file with frontmatter
    echo "---
title: $title
description: Learn about $title in Vue.js
---

# $title

Content for $title goes here.
" > temp_file
    
    # Append original content
    cat "$file" >> temp_file
    
    # Replace original file with new content
    mv temp_file "$file"
    
    echo "Added frontmatter to $file"
  fi
done

echo "Completed adding frontmatter to Vue documentation files"