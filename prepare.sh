#!/usr/bin/env bash
pages=("404.md" "categories.md" "tags.md")
theme_dirs=("assets" "_includes" "_layouts" "_sass")
custom_files=("_includes/head-custom.html" "_layouts/post.html" "_sass/*")

# link pages
for page in ${pages[@]}; do
    ln -rsf $page ../$page
done

# copy images
cp -rldf images/ ../

# copy customization files
for dir in ${theme_dirs[@]}; do
    [ -d ../$dir ] && rm -rf ../$dir
done
for file in ${custom_files[@]}; do
    mkdir -p ../`dirname $file`
    cp -rldf $file ../$file
done

# concatenate config
cp -rf _config.yml ../_config.yml
[ -f "../config.yml" ] && cat ../config.yml >> ../_config.yml

