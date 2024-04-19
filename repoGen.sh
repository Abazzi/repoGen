#!/bin/bash

repoGenTitle=$'
 ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄▀▀▀▄  ▄▀▀▀▀▄   ▄▀▀▀▀▄   ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄  ▄▀▀▄ ▄▄  
█   █   █ ▐  ▄▀   ▐ █   █   █ █      █ █        ▐  ▄▀   ▐ █  █ █ █ █ █   ▐ █  █   ▄▀ 
▐  █▀▀█▀    █▄▄▄▄▄  ▐  █▀▀▀▀  █      █ █    ▀▄▄   █▄▄▄▄▄  ▐  █  ▀█    ▀▄   ▐  █▄▄▄█  
 ▄▀    █    █    ▌     █      ▀▄    ▄▀ █     █ █  █    ▌    █   █  ▀▄   █     █   █  
█     █    ▄▀▄▄▄▄    ▄▀         ▀▀▀▀   ▐▀▄▄▄▄▀ ▐ ▄▀▄▄▄▄   ▄▀   █ ▄  █▀▀▀     ▄▀  ▄▀  
▐     ▐    █    ▐   █                  ▐         █    ▐   █    ▐    ▐       █   █    
           ▐        ▐                            ▐        ▐                 ▐   ▐    '

## Initialize repo for webpack project
webpack(){
    pnpm init 
    pnpm install -D  \
      style-loader css-loader css-minimizer-webpack-plugin \
      mini-css-extract-plugin\
      html-webpack-plugin\
      webpack-dev-server webpack webpack-cli\
      file-loader\
    pnpm install --save clean-webpack-plugin
    sed -i '7s/$/,/' package.json
    sed -i '7a "dev":"webpack-dev-server --config webpack.dev.js"' package.json
    sed -i '8s/$/,/' package.json
    sed -i '8a "build":"webpack"' package.json
}

# Install and Create all dependencies and starter files for Webpack JS repo
webpackJSDependencies(){
    pnpm install -D prettier eslint-config-prettier  \
    eslint eslint-config-prettier eslint-plugin-prettier \
    pnpm install --save clean-webpack-plugin
    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.gitignore .gitignore
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json .eslintrc.json 
    cp $HOME/repoGen/javascript/webpack.production.js webpack.production.js 
    cp $HOME/repoGen/javascript/webpack.dev.js webpack.dev.js 
    cp $HOME/repoGen/javascript/webpack.common.js webpack.common.js 
    ## Create Source folder and templates, css, and js folders 
    mkdir src
    cd src
    mkdir templates js css
    cd templates 
    cp $HOME/repoGen/index.html index.html
    cd ../
    cd js
    cp $HOME/repoGen/index.js index.js
    cd ../
    cd css
    cp $HOME/repoGen/styles.css styles.css 
    cd ../../
}

# Install and Create all dependencies and starter files for Webpack TS repo
webpackTSDependencies(){
    ## initalize git repo and install eslint, prettier, webpack and typescript
    pnpm install -D prettier eslint-config-prettier  \
      typescript ts-loader prettier-eslint\
      @typescript-eslint/eslint-plugin @typescript-eslint/parser \
      eslint-plugin-prettier\
    pnpm install --save clean-webpack-plugin

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.gitignore .gitignore
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/typescript/.eslintrc.json .eslintrc.json 
    cp $HOME/repoGen/typescript/webpack.production.js webpack.production.js 
    cp $HOME/repoGen/typescript/webpack.dev.js webpack.dev.js 
    cp $HOME/repoGen/typescript/webpack.common.js webpack.common.js 

    ## Create Source folder and templates, css, and ts folders 
    mkdir src
    cd src
    mkdir templates ts css
    cd templates 
    cp $HOME/repoGen/index.html index.html
    cd ../
    cd ts
    cp $HOME/repoGen/index.ts index.ts
    cd ../
    cd css
    cp $HOME/repoGen/styles.css styles.css 
    cd ../../
}

help(){
    echo -e "\033[32m ----------------------------------------\033[0m"
    echo -e "\033[32m Help: Genreating Webpack Repo "
    echo -e "\033[32m Example: ./repoGen.sh -j repo-name "
    echo -e "\033[32m [-j] Add Javascript Dependencies "
    echo -e "\033[32m [-t] Add Typescript Dependencies "
    echo -e "\033[32m ----------------------------------------\033[0m"
    exit 1
}

while getopts "j:t:h" opt; do 
  case $opt in
    j)
      i="$OPTARG"
      echo "$repoGenTitle"

      mkdir $i

      cd $i

      webpack

      webpackJSDependencies
      ;;
    t)
      i="$OPTARG"
      echo "$repoGenTitle"

      mkdir $i

      cd $i

      webpack

      webpackTSDependencies
      ;;
    h)
      help  
      ;;
    esac
  done
  shift $((OPTIND -1))
