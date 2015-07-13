-- Add lines for development testing,
-- to easily drop tables and data
-- for resetting 
DROP TABLE IF EXISTS indexed_text;

-- Create Tables for saving indexed
-- lines of the file
CREATE TABLE indexed_text (
  id SERIAL PRIMARY KEY,
  line_text varchar(250)
);