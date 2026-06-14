-- ============================================================
-- FinEdge Sentiment Badge Migration
-- Safe, non-destructive column addition
--
-- Run ONCE after importing db.sql and finedge-demo-data.sql
-- Existing posts get NULL (no badge shown) — zero breakage
-- ============================================================

-- Add sentiment column to posts table
-- DEFAULT NULL ensures all existing rows are unaffected
ALTER TABLE `posts`
  ADD COLUMN `sentiment` ENUM('bullish','bearish','neutral') DEFAULT NULL
  AFTER `post_time`;

-- Seed sentiment values on the 20 finance demo insights
-- Realistic values based on each post's content/tone
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 101; -- NIFTY breakout
UPDATE `posts` SET `sentiment` = 'bearish'  WHERE `post_id` = 102; -- Fed hawkish / EM outflows
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 103; -- HDFC Q4 strong
UPDATE `posts` SET `sentiment` = 'neutral'  WHERE `post_id` = 104; -- value patience
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 105; -- UPI as export
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 106; -- Axis Bank upgrade
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 107; -- SIP inflows structural
UPDATE `posts` SET `sentiment` = 'neutral'  WHERE `post_id` = 108; -- quant research
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 109; -- G-Sec real yield
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 110; -- ESG Tata Power
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 111; -- options put support
UPDATE `posts` SET `sentiment` = 'bearish'  WHERE `post_id` = 112; -- DXY / INR risk
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 113; -- Zomato unit econ
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 114; -- AI credit NPA
UPDATE `posts` SET `sentiment` = 'neutral'  WHERE `post_id` = 115; -- ICICI vs HDFC compare
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 116; -- Coal India value
UPDATE `posts` SET `sentiment` = 'neutral'  WHERE `post_id` = 117; -- NLP research
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 118; -- oil energy hedge
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 119; -- IPO pipeline
UPDATE `posts` SET `sentiment` = 'bullish'  WHERE `post_id` = 120; -- green bonds
