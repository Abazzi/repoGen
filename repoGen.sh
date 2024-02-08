#!/bin/bash

repoGenTitle=$'
 ▄▀▀▄▀▀▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▄▀▀▀▄  ▄▀▀▀▀▄   ▄▀▀▀▀▄   ▄▀▀█▄▄▄▄  ▄▀▀▄ ▀▄  ▄▀▀▀▀▄  ▄▀▀▄ ▄▄  
█   █   █ ▐  ▄▀   ▐ █   █   █ █      █ █        ▐  ▄▀   ▐ █  █ █ █ █ █   ▐ █  █   ▄▀ 
▐  █▀▀█▀    █▄▄▄▄▄  ▐  █▀▀▀▀  █      █ █    ▀▄▄   █▄▄▄▄▄  ▐  █  ▀█    ▀▄   ▐  █▄▄▄█  
 ▄▀    █    █    ▌     █      ▀▄    ▄▀ █     █ █  █    ▌    █   █  ▀▄   █     █   █  
█     █    ▄▀▄▄▄▄    ▄▀         ▀▀▀▀   ▐▀▄▄▄▄▀ ▐ ▄▀▄▄▄▄   ▄▀   █ ▄  █▀▀▀     ▄▀  ▄▀  
▐     ▐    █    ▐   █                  ▐         █    ▐   █    ▐    ▐       █   █    
           ▐        ▐                            ▐        ▐                 ▐   ▐    '

while getopts "j:b:t" opt; do
  case $opt in
    j)
      i="$OPTARG"
      echo "$repoGenTitle"
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.toml .prettierrc.toml
      cp ~/dotfiles/scripts/repoGen/javascript/.eslintrc.json .eslintrc.json 
      cp ~/dotfiles/scripts/repoGen/javascript/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/javascript/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/javascript/webpack.common.js webpack.common.js 

      ## Create Source folder and templates, css, and ts folders 
      mkdir src
      cd src
      mkdir templates js css
      cd templates 
      cp ~/dotfiles/scripts/repoGen/index.html index.html
      cd ../
      cd js
      cp ~/dotfiles/scripts/repoGen/index.js index.js
      cd ../
      cd css
      cp ~/dotfiles/scripts/repoGen/styles.css styles.css 
      cd ../../

      ## initalize git repo and install eslint, prettier, webpack and babel 
      pnpm init 
      pnpm add -D prettier eslint-config-prettier  \
        style-loader css-loader css-minimizer-webpack-plugin \
        mini-css-extract-plugin\
        html-webpack-plugin\
        webpack-dev-server webpack webpack-cli clean-webpack-plugin\
        file-loader babel-loader\
        eslint eslint-config-prettier eslint-plugin-prettier \
      pnpm add --save clean-webpack-plugin
      sed -i '7s/$/,/' package.json
      sed -i '7a "dev":"webpack serve --config webpack.dev.js"' package.json
      sed -i '8s/$/,/' package.json
      sed -i '8a "build":"webpack"' package.json
      echo "$i Repo Generated" 
      ;; 
    b)
      i="$OPTARG"
      echo "$repoGenTitle" 
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.toml .prettierrc.toml
      cp ~/dotfiles/scripts/repoGen/javascript/.eslintrc.json .eslintrc.json

      ## Create starter files
      mkdir src
      cd src
      touch index.html index.js styles.css
      cd ..

      ## initalize and install eslint, prettier
      pnpm init
      pnpm install -d prettier eslint-config-prettier --save-dev
      echo "$i Repo Generated" 
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires na argument" >&2
      exit 1
      ;;
    t)
      i="$OPTARG"
      echo "$repoGenTitle" 
      mkdir $i

      cd $i

      ## Copy Favicon, gitignore and prettier config 
      cp ~/dotfiles/assets/favicon.ico favicon.ico
      cp ~/dotfiles/gitconfig/.gitignore .gitignore
      cp ~/dotfiles/scripts/repoGen/.prettierrc.toml .prettierrc.toml
      cp ~/dotfiles/scripts/repoGen/typescript/.eslintrc.json .eslintrc.json 
      cp ~/dotfiles/scripts/repoGen/typescript/tsconfig.json tsconfig.json
      cp ~/dotfiles/scripts/repoGen/typescript/webpack.production.js webpack.production.js 
      cp ~/dotfiles/scripts/repoGen/typescript/webpack.dev.js webpack.dev.js 
      cp ~/dotfiles/scripts/repoGen/typescript/webpack.common.js webpack.common.js 

      ## Create starter files
      mkdir src
      cd src
      mkdir templates ts css 
      cd templates 
      cp ~/dotfiles/scripts/repoGen/index.html index.html
      cd ../
      cd ts
      cp ~/dotfiles/scripts/repoGen/index.ts index.ts
      cd ../
      cd css
      cp ~/dotfiles/scripts/repoGen/styles.css styles.css
      cd ../../

      ## initalize git repo and install eslint, prettier, webpack 
      #& typescript
      pnpm init 
      pnpm add -D prettier eslint-config-prettier  \
        style-loader css-loader css-minimizer-webpack-plugin \
        mini-css-extract-plugin\
        html-webpack-plugin\
        typescript ts-loader webpack-dev-server webpack webpack-cli\
        file-loader\
        @typescript-eslint/eslint-plugin @typescript-eslint/parser \
        eslint-config-prettier eslint-plugin-prettier\
      pnpm add --save clean-webpack-plugin
      sed -i '7s/$/,/' package.json
      sed -i '7a "dev":"webpack-dev-server --config webpack.dev.js"' package.json
      sed -i '8s/$/,/' package.json
      sed -i '8a "build":"webpack"' package.json
      echo "$i Setup Finished"
      ;;
  esac
done
shift $((OPTIND -1))

