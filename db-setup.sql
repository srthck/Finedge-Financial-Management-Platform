-- FinEdge Database Setup Script
-- Run this INSTEAD of db.sql, or run db.sql first then run this patch.
--
-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS `finedge` CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `finedge`;

-- Step 2: Add sentiment column to posts table (Phase 3 — Sentiment Badges)
-- Run this after importing db.sql into the 'finedge' database.
ALTER TABLE `posts`
  ADD COLUMN IF NOT EXISTS `sentiment` ENUM('bullish','bearish','neutral') NOT NULL DEFAULT 'neutral';

-- Step 3: If you imported db.sql into 'finedge', rename it:
-- (Run in phpMyAdmin or CLI as root, then update .env MYSQL_DATABASE=finedge)
-- RENAME TABLE `finedge`.`blocks` TO `finedge`.`blocks`;
-- ... etc — easier to just import db.sql directly into a database named 'finedge'
