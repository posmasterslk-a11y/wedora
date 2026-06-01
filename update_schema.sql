-- 1. Add map_url to invitations table
ALTER TABLE invitations ADD COLUMN IF NOT EXISTS map_url TEXT;

-- 2. Create RSVPs table
CREATE TABLE IF NOT EXISTS rsvps (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    invitation_id UUID REFERENCES invitations(id) ON DELETE CASCADE,
    guest_name TEXT NOT NULL,
    is_attending BOOLEAN NOT NULL,
    guest_count INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now())
);

-- 3. Enable RLS on RSVPs
ALTER TABLE rsvps ENABLE ROW LEVEL SECURITY;

-- 4. Allow public to insert RSVPs (anyone can RSVP to a public invite)
CREATE POLICY "Public can insert rsvps"
ON rsvps FOR INSERT
TO public
WITH CHECK (true);

-- 5. Allow only the creator of the invitation to view its RSVPs
CREATE POLICY "Creators can view their RSVPs"
ON rsvps FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM invitations
    WHERE invitations.id = rsvps.invitation_id
    AND invitations.user_id = auth.uid()
  )
);
