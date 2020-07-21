module.exports = {
  env: {
    browser: true,
    es6: true,
    node: true,
  },
  extends: ['eslint:recommended', 'google', 'plugin:react/recommended'],
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 2020,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  rules: {
    'arrow-parens': [1, 'as-needed'],
    'no-invalid-this': 0,
    indent: 0,
    'max-len': [1, 88],
    'no-empty': 1,
    'no-unused-vars': 'warn',
    'operator-linebreak': 0,
    'object-curly-spacing': [1, 'always'],
    'react/no-unescaped-entities': 0,
    'react/prop-types': 1,
    'require-jsdoc': 0,
  },
};
