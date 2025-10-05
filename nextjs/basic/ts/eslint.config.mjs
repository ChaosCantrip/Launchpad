import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const compat = new FlatCompat({
  baseDirectory: __dirname,
});

const eslintConfig = [
  ...compat.extends("next/core-web-vitals", "next/typescript"),
  {
    ignores: [
      "node_modules/**",
      ".next/**",
      "out/**",
      "build/**",
      "next-env.d.ts",
    ],
  },
  {
    rules: {
      "brace-style": ["warn", "allman"],
      "quotes": ["warn", "double"],
      "indent": ["warn", 4, { "SwitchCase": 1 }],
    }
  },
  {
    files: ["**/*.{mjs,mts}"],
    rules: {
      "indent": ["warn", 2, { "SwitchCase": 1 }]
    }
  }
];

export default eslintConfig;
