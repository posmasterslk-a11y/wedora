-- Fix for the RLS policy on invitations table
ALTER TABLE invitations ALTER COLUMN user_id SET DEFAULT auth.uid();

DROP POLICY IF EXISTS "Users can insert own invitations" ON invitations;
CREATE POLICY "Users can insert own invitations" 
ON invitations FOR INSERT 
TO authenticated 
WITH CHECK (auth.uid() = user_id);
