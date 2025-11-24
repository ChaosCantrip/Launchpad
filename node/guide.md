# Setting Up Node, TypeScript and ESLint

This is just a quick reference because I constantly forget how to setup TypeScript and ESLint how I like them.

## Creating a node.js project

`npm init -y`

## Add the Recommended `.gitignore`

```gitignore
/node_modules

npm-debug.log*
.DS_Store

.env

/data

dist/
```

## Install TypeScript

`npm install --save-dev typescript ts-node @types/node`

## Initialise TypeScript

`npx tsc --init`

## Recommended TypeScript Settings

```json
// tsconfig.json

{
  "compilerOptions": {
    "module": "ESNext",
    "moduleResolution": "Node",
    "target": "ES2020",
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "rootDir": "./src",
    "outDir": "./dist"
  }
}
```

## Install ESLint

`npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin globals`

## Recommended ESLint Settings

```mjs
import js from "@eslint/js";
import globals from "globals";
import tseslint from "typescript-eslint";
import { defineConfig } from "eslint/config";

export default defineConfig([
  tseslint.configs.recommended,
  {
    ignores: [
      "dist/",
      "node_modules/",
    ]
  },
  {
    files: ["**/*.{js,mjs,cjs,ts,mts,cts}"],
    plugins: {
      js
    },
    extends: ["js/recommended"],
    languageOptions: {
      globals: globals.node
    },
    rules: {
      "brace-style": ["warn", "allman"],
      "quotes": ["warn", "double"],
      "no-unused-vars": "off",
      "@typescript-eslint/no-unused-vars": "warn",
      "indent": ["warn", 4, { "SwitchCase": 1 }]
    }
  },
  {
    files: ["**/*.{mjs,mts}"],
    rules: {
      "indent": ["warn", 2, { "SwitchCase": 1 }]
    }
  }
]);
```

## Add Scripts to `package.json`

```json
// package.json

"scripts": {
  "build": "tsc",
  "start": "node dist/index.js",
  "dev": "ts-node src/index.ts",
  "lint": "eslint ."
  "lint:fix": "eslint . --fix"
}
```

## Recommended Dockerfile
```Dockerfile
# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Runtime
FROM node:20-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./
RUN npm install --omit=dev
CMD ["node", "dist/index.js"]
```

## Cheeky Script to Do This :D

```bash
curl -sSL https://raw.githubusercontent.com/ChaosCantrip/Launchpad/main/node/install-example.sh | bash
```