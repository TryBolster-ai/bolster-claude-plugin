#!/usr/bin/env bash
# Builds the two upload archives from this repo into dist/:
#   bolster-claude.zip  - the Claude plugin as it sits in the repo (.claude-plugin/, .mcp.json, skills/).
#   bolster-openai.zip  - the same skills packaged in OpenAI's portable layout: plugin.json and
#                         mcp.json at the archive root (from openai/), skills/ and assets/ beside them.
# Both carry no keys: the MCP server signs each user in with OAuth.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist/openai/assets
zip -qr dist/bolster-claude.zip .claude-plugin .mcp.json skills README.md LICENSE -x '.DS_Store'
cp openai/plugin.json openai/mcp.json dist/openai/
cp -R skills dist/openai/skills
cp .claude-plugin/icon.png dist/openai/assets/icon.png
cp .claude-plugin/icon.png dist/openai/assets/logo.png
cp LICENSE dist/openai/
(cd dist/openai && zip -qr ../bolster-openai.zip . -x '.DS_Store')
rm -rf dist/openai
ls -l dist
