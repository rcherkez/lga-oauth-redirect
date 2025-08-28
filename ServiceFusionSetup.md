# Service Fusion Integration Setup Guide

## Overview
This integration allows you to fetch dispatched jobs from Service Fusion and sync them into your LGA Employee app automatically.

## Prerequisites
1. Service Fusion account with API access (Pro plan required)
2. Service Fusion API credentials:
   - Client ID
   - Client Secret
   - Username
   - Password

## How to Get Service Fusion API Credentials

### Step 1: Enable OAuth in Service Fusion
1. Log into your Service Fusion account
2. Navigate to **Settings** → **API** → **OAuth**
3. Enable OAuth for your instance
4. Note down the OAuth endpoint URL

### Step 2: Get Client Credentials
1. Contact Service Fusion support to request API credentials
2. You'll receive:
   - **Client ID**: Your unique application identifier
   - **Client Secret**: Your application's secret key
   - **Username**: API user account username
   - **Password**: API user account password

## Setup Instructions

### Step 1: Configure Credentials
1. Open the LGA Employee app
2. Navigate to **Settings** → **Service Fusion Sync**
3. Tap **Configure** in the top right
4. Enter your credentials:
   - **Client ID**: Your Service Fusion client ID
   - **Client Secret**: Your Service Fusion client secret
   - **Username**: Your API username
   - **Password**: Your API password
5. Tap **Save**

### Step 2: Test the Integration
1. Ensure you have some dispatched jobs in Service Fusion with status "assigned" or "confirmed"
2. In the Service Fusion Sync view, tap **Sync Jobs Now**
3. Monitor the sync result for any errors

### Step 3: Verify Jobs are Synced
1. Go to the **Jobs** tab in the app
2. Check if the Service Fusion jobs appear in your job list
3. Jobs will be marked with job numbers from Service Fusion

## What Gets Synced

The integration syncs the following data from Service Fusion:
- **Work Orders** with status "assigned" or "confirmed"
- **Customer Information** (name, contact details)
- **Service Location** (address, access instructions)
- **Job Description** and work type
- **Scheduled Date/Time** (if available)
- **Services** (if specified in Service Fusion)

## Job Status Mapping

Service Fusion statuses are mapped to LGA Employee statuses as follows:
- `assigned`, `confirmed` → `scheduled`
- `published` → `pending`
- `work_done` → `inProgress`
- `approved` → `completed`
- `cancelled` → `cancelled`

## Environment Configuration

### Production Environment
- Base URL: `https://api.fieldnation.com`
- Use your production Service Fusion credentials

### Sandbox Environment (for testing)
- Base URL: `https://api-sandbox.fndev.net`
- Use your sandbox Service Fusion credentials

To switch environments, update the `baseURL` in `ServiceFusionService.swift`:

```swift
private let baseURL = "https://api-sandbox.fndev.net" // For sandbox
// or
private let baseURL = "https://api.fieldnation.com" // For production
```

## Security Notes

⚠️ **Important**: The current implementation stores credentials in UserDefaults for simplicity. For production use, consider using iOS Keychain for secure credential storage.

## Troubleshooting

### Common Issues

1. **Authentication Failed**
   - Verify your credentials are correct
   - Ensure your Service Fusion account has API access enabled
   - Check that you're using the correct environment (production vs sandbox)

2. **No Jobs Returned**
   - Verify you have jobs with status "assigned" or "confirmed" in Service Fusion
   - Check that the jobs are actually dispatched and not just published

3. **Sync Errors**
   - Check your internet connection
   - Ensure your Service Fusion account is active
   - Verify the API endpoints are accessible

### Debug Mode
For debugging, you can enable diagnostic mode in the service by setting:
```swift
diagnostic_mode = true
```

This will print detailed information about API requests and responses.

## API Rate Limits

Service Fusion has rate limits on their API. The integration handles this by:
- Caching OAuth tokens for 1 hour
- Only syncing jobs that don't already exist in the local database
- Providing manual sync controls (no automatic background sync)

## Future Enhancements

Potential improvements to consider:
- **Automatic Sync**: Background sync on app launch or periodic intervals
- **Two-way Sync**: Update Service Fusion when job status changes in LGA Employee
- **Real-time Updates**: Webhook support for instant notifications
- **Selective Sync**: Choose which job types or customers to sync
- **Conflict Resolution**: Handle cases where jobs are modified in both systems

## Support

For issues related to:
- **Service Fusion API**: Contact Service Fusion support
- **LGA Employee Integration**: Contact your development team

## API Documentation

For detailed API documentation, visit:
- Service Fusion API Docs: https://developer.fieldnation.com/client-api/restapi/
- Service Fusion OAuth: https://developer.fieldnation.com/client-api/restapi/oauth_get/ 