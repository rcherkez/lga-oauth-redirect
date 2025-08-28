# LGA Notifications - Service Fusion Integration

This repository hosts the web-based OAuth integration for connecting the LGA Employee app to Service Fusion.

## Setup Instructions

### 1. GitHub Pages Configuration

1. Go to your GitHub repository settings
2. Scroll down to "GitHub Pages" section
3. Set source to "Deploy from a branch"
4. Select your main branch (usually `main` or `master`)
5. Set folder to `/ (root)`
6. Click "Save"

### 2. Custom Domain Setup

1. In the GitHub Pages section, add your custom domain: `lganotifications.online`
2. Check "Enforce HTTPS"
3. Add a CNAME record in your DNS:
   - Type: `CNAME`
   - Name: `@` or leave empty
   - Value: `yourusername.github.io` (replace with your actual GitHub username)
4. Wait for DNS propagation (can take up to 24 hours)

### 3. Service Fusion OAuth Configuration

The app is configured with:
- **Client ID**: `0bNmUp84YQ7r-2hgKa`
- **Redirect URL**: `https://lganotifications.online`
- **Client Secret**: `by_3URgs4KJ|4aRTh1M-NWdsPKIERZOc`

## Files

- `index.html` - Main redirect page
- `servicefusion-oauth.html` - OAuth login and job fetching interface
- `test-oauth.html` - Test page to verify OAuth endpoints

## How It Works

1. User visits `https://lganotifications.online`
2. Clicks "Login to Service Fusion"
3. Redirected to Service Fusion OAuth authorization
4. After authorization, returns with authorization code
5. Exchanges code for access token
6. Fetches and displays jobs from Service Fusion

## Important Notes

✅ **OAuth endpoints have been updated with the correct Service Fusion API URLs:**
- Authorization URL: `https://api.servicefusion.com/oauth/authorize`
- Token endpoint: `https://api.servicefusion.com/oauth/access_token`
- Jobs API: `https://api.servicefusion.com/workorders`

## Testing

Once deployed, visit `https://lganotifications.online` to test the OAuth flow.

## Troubleshooting

- Check browser console for errors
- Verify DNS propagation for custom domain
- Ensure Service Fusion OAuth app is properly configured
- Check CORS settings if API calls fail
