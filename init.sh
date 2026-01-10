#!/bin/bash
# expo-ez-template init script
# Usage: ./init.sh my-app-name my-author-name

set -e

APP_NAME="$1"
AUTHOR="${2:-animecruizer}"

if [ -z "$APP_NAME" ]; then
  echo "Usage: ./init.sh <app-name> [author-name]"
  echo "Example: ./init.sh my-cool-app animecruizer"
  exit 1
fi

# Convert app name to slug (lowercase, hyphens)
APP_SLUG=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$(pwd)/$APP_SLUG"

echo "🚀 Creating new Expo app: $APP_NAME"
echo "   Slug: $APP_SLUG"
echo "   Author: $AUTHOR"
echo "   Target: $TARGET_DIR"
echo ""

# Create target directory
mkdir -p "$TARGET_DIR"

# Copy template files
echo "📁 Copying template files..."

# Use rsync to copy everything, excluding specific files/dirs
# Using rsync ensures hidden files and directory structure are preserved correctly
if command -v rsync &> /dev/null; then
    rsync -av --exclude '.git' --exclude 'node_modules' --exclude 'init.sh' --exclude '.DS_Store' --exclude 'build' --exclude 'dist' "$SCRIPT_DIR/" "$TARGET_DIR/"
else
    # Fallback to cp if rsync is missing (less precise)
    echo "⚠️ rsync not found, using cp..."
    cp -R "$SCRIPT_DIR/"* "$TARGET_DIR/" || true
    # Copy hidden files separately if glob didn't catch them
    cp -R "$SCRIPT_DIR/".* "$TARGET_DIR/" 2>/dev/null || true
    
    # Clean up excluded items
    rm -rf "$TARGET_DIR/.git" "$TARGET_DIR/node_modules" "$TARGET_DIR/init.sh"
fi

# Replace placeholders
echo "🔧 Replacing placeholders..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS sed
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i '' "s/{{APP_NAME}}/$APP_NAME/g" {} \;
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i '' "s/{{APP_SLUG}}/$APP_SLUG/g" {} \;
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i '' "s/{{AUTHOR}}/$AUTHOR/g" {} \;
else
  # Linux sed
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i "s/{{APP_NAME}}/$APP_NAME/g" {} \;
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i "s/{{APP_SLUG}}/$APP_SLUG/g" {} \;
  find "$TARGET_DIR" -type f \( -name "*.js" -o -name "*.json" -o -name "*.md" -o -name "*.ts" -o -name "*.tsx" -o -name "*.config.js" \) -exec sed -i "s/{{AUTHOR}}/$AUTHOR/g" {} \;
fi

# Initialize git
echo "🔧 Initializing git repository..."
cd "$TARGET_DIR"
if [ ! -d ".git" ]; then
  git init
  # Rename initial branch to main if configured, or let git default
  git add .
  git commit -m "chore: initial commit from expo-ez-template"
fi

# Install dependencies
echo "📥 Installing dependencies with bun..."
bun install

echo ""
echo "✅ Done! Your new app is ready at: $TARGET_DIR"
echo ""
echo "Next steps:"
echo "  cd $APP_SLUG"
echo "  bun run android"
