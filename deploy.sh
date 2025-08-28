#!/bin/bash

echo "🚀 Deploying LGA Notifications to GitHub Pages..."

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not found. Please initialize git first:"
    echo "   git init"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git"
    exit 1
fi

# Add all files
git add .

# Commit changes
git commit -m "Update Service Fusion OAuth integration"

# Push to main branch
git push origin main

echo "✅ Deployment complete!"
echo "🌐 Your site should be available at: https://lganotifications.online"
echo "⏳ Note: DNS changes may take up to 24 hours to propagate"
echo ""
echo "📋 Next steps:"
echo "1. Go to your GitHub repository settings"
echo "2. Enable GitHub Pages (Settings > Pages)"
echo "3. Set custom domain to: lganotifications.online"
echo "4. Add CNAME record in your DNS pointing to: yourusername.github.io"
