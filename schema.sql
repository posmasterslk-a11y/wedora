-- Create invitations table
CREATE TABLE invitations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    couple_names TEXT NOT NULL,
    event_date TIMESTAMP WITH TIME ZONE NOT NULL,
    location TEXT NOT NULL,
    special_comments TEXT,
    theme_color TEXT DEFAULT 'rose',
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- Enable Row Level Security (RLS)
ALTER TABLE invitations ENABLE ROW LEVEL SECURITY;

-- Create policy for users to see only their own invitations in the dashboard
CREATE POLICY "Users can view own invitations"
ON invitations FOR SELECT
USING (auth.uid() = user_id);

-- Create policy for public to view any invitation by ID (for the shared link)
CREATE POLICY "Public can view any invitation"
ON invitations FOR SELECT
USING (true);

-- Create policy for users to insert their own invitations
CREATE POLICY "Users can insert own invitations"
ON invitations FOR INSERT
WITH CHECK (auth.uid() = user_id);

-- Create policy for users to update their own invitations
CREATE POLICY "Users can update own invitations"
ON invitations FOR UPDATE
USING (auth.uid() = user_id);

-- Create policy for users to delete their own invitations
CREATE POLICY "Users can delete own invitations"
ON invitations FOR DELETE
USING (auth.uid() = user_id);

-- Create storage bucket for invitation images
INSERT INTO storage.buckets (id, name, public) VALUES ('invites', 'invites', true);

-- Enable RLS for storage
CREATE POLICY "Anyone can view invite images"
ON storage.objects FOR SELECT
USING ( bucket_id = 'invites' );

CREATE POLICY "Authenticated users can upload invite images"
ON storage.objects FOR INSERT
WITH CHECK ( bucket_id = 'invites' AND auth.role() = 'authenticated' );
