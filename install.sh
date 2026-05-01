#!/bin/bash

# Product-Doc-Lifecycle Skill 一键安装脚本
# 适用于 Linux 和 macOS

set -e

echo "🚀 Installing Product-Doc-Lifecycle Skill for CodeBuddy..."
echo ""

# 检测 CodeBuddy skills 目录
SKILLS_DIR="$HOME/.codebuddy/skills"
if [ ! -d "$SKILLS_DIR" ]; then
    echo "⚠️  Warning: CodeBuddy skills directory not found at $SKILLS_DIR"
    echo "   Creating directory..."
    mkdir -p "$SKILLS_DIR"
fi

# 临时目录
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "📥 Downloading from GitHub..."
git clone --depth 1 https://github.com/Ptt-James/product-doc-lifecycle-AI.git > /dev/null 2>&1
if [ ! -d "product-doc-lifecycle-AI" ]; then
    echo "❌ Failed to clone repository"
    exit 1
fi

echo "📦 Installing Skill..."
cp -r product-doc-lifecycle-AI/product-doc-lifecycle "$SKILLS_DIR/"

# 清理临时目录
cd /
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Skill location: $SKILLS_DIR/product-doc-lifecycle"
echo ""
echo "To verify installation, ask AI in CodeBuddy:"
echo '  "List available skills"'
echo ""
echo "To get started, try:"
echo '  "Help me initialize the documentation system"'
