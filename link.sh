#!/usr/bin/env bash
icons=("android-chrome-72x72.png" "apple-touch-icon.png" "browserconfig.xml" "favicon-16x16.png" "favicon-32x32.png" "favicon.ico" "mstile-150x150.png" "safari-pinned-tab.svg" "site.webmanifest")
pages=("404.md" "categories.md" "tags.md")
dirs=("assets" "_data" "_includes" "_layouts" "_sass")

# link icons
for icon in ${icons[@]}; do
    ln -rsf $icon ../$icon
done
# link pages
for page in ${pages[@]}; do
    ln -rsf $page ../$page
done
# link images
for image in `ls images/`; do
    ln -rsf images/$image ../images/$image
done
exit 0
# link directories
for dir in ${dirs[@]}; do
    ln -rsf $dir/ ../$dir
done

