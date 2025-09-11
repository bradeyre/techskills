# Supabase Setup Guide for TechSkills Workshop System

## 1. Create Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Sign up/Login with your GitHub account
3. Click "New Project"
4. Choose your organization
5. Enter project details:
   - **Name**: `techskills-workshop`
   - **Database Password**: Choose a strong password (save this!)
   - **Region**: Choose closest to your location
6. Click "Create new project"
7. Wait for the project to be created (2-3 minutes)

## 2. Get Project Credentials

1. In your Supabase dashboard, go to **Settings** → **API**
2. Copy the following values:
   - **Project URL** (looks like: `https://your-project-id.supabase.co`)
   - **anon public** key (starts with `eyJ...`)

## 3. Set Up Database Schema

1. In your Supabase dashboard, go to **SQL Editor**
2. Click "New query"
3. Copy and paste the contents of `supabase-schema.sql`
4. Click "Run" to create all tables and relationships

## 4. Seed Initial Data

1. In the SQL Editor, create another new query
2. Copy and paste the contents of `supabase-seed-data.sql`
3. Click "Run" to populate the database with initial data

## 5. Update Application Configuration

1. Open `index-supabase.html`
2. Find these lines near the top:
   ```javascript
   const SUPABASE_URL = 'YOUR_SUPABASE_URL';
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
   ```
3. Replace with your actual values:
   ```javascript
   const SUPABASE_URL = 'https://your-project-id.supabase.co';
   const SUPABASE_ANON_KEY = 'eyJ...your-actual-key...';
   ```

## 6. Deploy Updated Application

1. Replace `index.html` with `index-supabase.html`:
   ```bash
   cp index-supabase.html index.html
   ```
2. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Add Supabase integration for persistent data storage"
   git push origin main
   ```

## 7. Verify Everything Works

1. Visit your deployed application
2. Sign in with `admin` / `a123456`
3. Click "Seed Everything" to populate the database
4. Check that data persists when you refresh the page
5. Try editing technician names and verify changes are saved

## Database Structure

The system uses these main tables:

- **teams**: PR and TR teams
- **technicians**: Individual technicians with team assignments
- **tasks**: Repair tasks with categories, difficulty levels, and team assignments
- **assessments**: Skill assessments linking technicians to tasks
- **notifications**: Training reminders and alerts

## Benefits of Supabase Integration

✅ **Persistent Data**: Data survives deployments and browser refreshes
✅ **Real-time Updates**: Changes sync across all connected devices
✅ **Scalable**: Can handle multiple users and large datasets
✅ **Secure**: Row-level security and authentication
✅ **Backup**: Automatic database backups
✅ **API**: RESTful API for future integrations

## Troubleshooting

### If "Seed Everything" doesn't work:
1. Check browser console for errors
2. Verify Supabase credentials are correct
3. Ensure database schema was created successfully
4. Check that seed data was inserted

### If data doesn't persist:
1. Verify you're using the Supabase version (`index-supabase.html`)
2. Check that RLS policies are set to allow public access
3. Ensure the database connection is working

### If you see authentication errors:
1. Check that the Supabase URL and key are correct
2. Verify the project is active and not paused
3. Check that the anon key has the right permissions

## Next Steps

Once Supabase is set up, you can:
- Add more sophisticated authentication
- Set up proper user roles and permissions
- Add data validation and constraints
- Implement advanced reporting features
- Add mobile app support
