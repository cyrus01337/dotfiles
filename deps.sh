#!/usr/bin/env bash
deps="@ianvs/prettier-plugin-sort-imports @tailwindcss/typography eslint postcss postcss-flexbugs-fixes postcss-preset-env prettier prettier-plugin-sort-json tailwindcss"
cmd="npm install"

if command -v pnpm &> /dev/null; then
    cmd="pnpm add"
elif command -v yarn &> /dev/null; then
    cmd="yarn add"
fi

installed=$(eval "$cmd $deps -D")

if [[ $installed ]]; then
    exit 0
else
    rm -f deps.sh

    exit 1
fi
