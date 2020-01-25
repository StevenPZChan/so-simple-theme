#!/usr/bin/env bash
icons=("android-chrome-72x72.png" "apple-touch-icon.png" "browserconfig.xml" "favicon-16x16.png" "favicon-32x32.png" "favicon.ico" "mstile-150x150.png" "safari-pinned-tab.svg" "site.webmanifest")
pages=("404.md" "categories.md" "tags.md")
dirs=("assets" "_data" "_includes" "_layouts" "_sass")

# copy icons
for icon in ${icons[@]}; do
    cp -rldf $icon ../$icon
done

# link pages
for page in ${pages[@]}; do
    ln -rsf $page ../$page
done

# copy images
cp -rldf images/ ../

# copy directories
for dir in ${dirs[@]}; do
    [ -d ../$dir ] && rm -rf ../$dir
    cp -rldf $dir ../
done
[ -f "../navigation.yml" ] && cp -rldf ../navigation.yml ../_data/navigation.yml

# concatenate config
cp -rf _config.yml ../_config.yml
[ -f "../config.yml" ] && cat ../config.yml >> ../_config.yml

# gemspec
cp -rldf Gemfile jekyll-theme-so-simple.gemspec ../

