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
    pnpm add -D  \
      style-loader css-loader css-minimizer-webpack-plugin \
      mini-css-extract-plugin\
      html-webpack-plugin\
      webpack-dev-server webpack webpack-cli\
      file-loader\
    pnpm add --save clean-webpack-plugin
    sed -i '7s/$/,/' package.json
    sed -i '7a "dev":"webpack-dev-server --config webpack.dev.js"' package.json
    sed -i '8s/$/,/' package.json
    sed -i '8a "build":"webpack"' package.json
}

# Install and Create all dependencies and starter files for Webpack JS repo
webpackJSDependencies(){
    pnpm add -D prettier eslint-config-prettier  \
    eslint eslint-config-prettier eslint-plugin-prettier \
    pnpm add --save clean-webpack-plugin
    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.gitignore .gitignore
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json .eslintrc.json 
    cp $HOME/repoGen/javascript/webpack.production.js webpack.production.js 
    cp $HOME/repoGen/javascript/webpack.dev.js webpack.dev.js 
    cp $HOME/repoGen/javascript/webpack.common.js webpack.common.js 
    ## Create Source folder and templates, css, and ts folders 
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

webpackTSDependencies(){
    ## initalize git repo and install eslint, prettier, webpack and typescript
    pnpm add -D prettier eslint-config-prettier  \
      typescript ts-loader prettier-eslint\
      @typescript-eslint/eslint-plugin @typescript-eslint/parser \
      eslint-plugin-prettier\
    pnpm add --save clean-webpack-plugin

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.gitignore .gitignore
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/typescript/.eslintrc.json .eslintrc.json 
    cp $HOME/repoGen/typescript/webpack.production.js webpack.production.js 
    cp $HOME/repoGen/typescript/webpack.dev.js webpack.dev.js 
    cp $HOME/repoGen/typescript/webpack.common.js webpack.common.js 
}

viteJS(){
    ## Run Create Vite command with param as repo title
    pnpm create vite $i --template vanilla
    cd $i

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json .eslintrc.json
    cp $HOME/repoGen/vite.config.js vite.config.js 
    cp $HOME/repoGen/readme_template.md README.md

    ## install eslint and prettier
    pnpm install -D \
      prettier \
      eslint-config-prettier \
      eslint \
      eslint-plugin-prettier \
      vite-plugin-eslint \
      vitest

    sed -i '8s/$/,/' package.json
    sed -i '8a "test":"vitest"' package.json
}

viteTS(){
    ## Run Create Vite command with param as repo title
    pnpm create vite $i --template vanilla
    cd $i

    ## Copy Favicon, gitignore and prettier config 
    cp $HOME/repoGen/favicon.ico favicon.ico
    cp $HOME/repoGen/.prettierrc.toml .prettierrc.toml
    cp $HOME/repoGen/javascript/.eslintrc.json .eslintrc.json
    cp $HOME/repoGen/vite.config.js vite.config.js 
    cp $HOME/repoGen/readme_template.md README.md

    ## install eslint and prettier
    pnpm install -D \
      prettier \
      eslint-config-prettier \
      eslint \
      eslint-plugin-prettier \
      vite-plugin-eslint \
      vitest

    sed -i '8s/$/,/' package.json
    sed -i '8a "test":"vitest"' package.json
}

help(){
    echo "Help" >&2
    echo -e "\033[32m ----------------------------------------\033[0m"
    echo -e "\033[32m Help: Genreating Webpack Repo "
    echo -e "\033[32m [-w] Generate Webpack Repo "
    echo -e "\033[32m [-j] Add Javascript Dependencies "
    echo -e "\033[32m [-t] Add Typescript Dependencies "
    echo -e "\033[32m ----------------------------------------\033[0m"
    echo -e "\033[32m ----------------------------------------\033[0m"
    echo -e "\033[32m Help: Genreating Vite Repo "
    echo -e "\033[32m [-v] Generate Webpack Repo "
    echo -e "\033[32m [-j] Add Javascript Dependencies "
    echo -e "\033[32m [-t] Add Typescript Dependencies "
    echo -e "\033[32m ----------------------------------------\033[0m"
    exit 1
}

if [[ $1 == "-h" ]]; then
 help 
fi
if [[ $1 == "-w" && $2 == "-j" && ! -z $3 ]]; then
 mkdir $3 
 cd $3
 webpack
 webpackJSDependencies
fi
if [[ $1 == "-w" && $2 == "-t" && ! -z $3 ]]; then
 mkdir $3 
 cd $3
 webpack
 webpackTSDependencies 
fi
if [[ $1 == "-v" && $2 == "-j" && ! -z $3 ]]; then
 mkdir $3 
 cd $3
 viteJS 
fi
if [[ $1 == "-v" && $2 == "-t" && ! -z $3 ]]; then
mkdir $3 
cd $3
viteTS 
fi
