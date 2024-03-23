#!/bin/bash
# Install JS Deps for Vite in current directory 
viteJSDeps(){

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json .eslintrc.json
    cp $HOME/repoGen/vite.config.js vite.config.js 
    cp $HOME/repoGen/readme_template.md README.md

    ## install eslint and prettier
    pnpm add -D \
      prettier \
      eslint-config-prettier \
      eslint \
      eslint-plugin-prettier \
      vite-plugin-eslint \
      vitest 
}

# Install TS Deps for Vite in current directory 
viteTSDeps(){

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico ./favicon.ico
    cp $HOME/repoGen/.prettierrc.toml ./.prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json ./.eslintrc.json
    cp $HOME/repoGen/vite.config.js ./vite.config.js 
    cp $HOME/repoGen/readme_template.md ./README.md

    ## install eslint and prettier
    pnpm add -D \
      prettier \
      eslint-config-prettier \
      eslint \
      eslint-plugin-prettier \
      vite-plugin-eslint 
}

while getopts "jth" opt; do 
  case $opt in
    j)
      viteJSDeps 
      ;;
    t)
      viteTSDeps
      ;;
    h)
      help  
      ;;
    esac
  done
  shift $((OPTIND -1))
