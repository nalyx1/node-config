#!/bin/bash

git init &&
npm init -y && 
npm i -D @types/jest @types/node @typescript-eslint/eslint-plugin typescript eslint git-commit-msg-linter husky jest lint-staged &&
tsc --init &&
npm init @eslint/config &&
npx husky install && 
npx husky add .husky/pre-commit "npx lint-staged" &&
npx husky add .husky/commit-msg ".git/hooks/commit-msg \$1" &&
jest --init

touch .gitignore
echo 'node_modules
dist' >> .gitignore

touch .eslintignore
echo 'node_modules
dist' >> .eslintignore

touch .lintstagedrc.json
echo '{
  "*.ts": [
    "eslint 'src/**' --fix"
  ]
}' >> .lintstagedrc.json
