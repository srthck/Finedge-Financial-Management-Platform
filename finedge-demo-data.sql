-- ============================================================
-- FinEdge Demo Data — Finance-Themed Investor Ecosystem
-- Version: 2.0 (corrected imgSrc references)
--
-- INSTRUCTIONS:
-- 1. Import base db.sql first (creates tables)
-- 2. Run this file to replace demo data
--
-- All user passwords: Password@123
-- Bcrypt hash used: $2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu
--
-- imgSrc values reference files that ALREADY EXIST in dist/posts/
-- No new image files are needed.
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------
-- CLEAR ALL OLD DATA (safe — no schema changes)
-- --------------------------------------------------------
DELETE FROM `notifications`;
DELETE FROM `shares`;
DELETE FROM `likes`;
DELETE FROM `bookmarks`;
DELETE FROM `comments`;
DELETE FROM `hashtags`;
DELETE FROM `post_tags`;
DELETE FROM `profile_views`;
DELETE FROM `recommendations`;
DELETE FROM `messages`;
DELETE FROM `conversations`;
DELETE FROM `group_members`;
DELETE FROM `groups`;
DELETE FROM `posts`;
DELETE FROM `tags`;
DELETE FROM `follow_system`;
DELETE FROM `blocks`;
DELETE FROM `favourites`;
DELETE FROM `users`;

SET FOREIGN_KEY_CHECKS = 1;

-- --------------------------------------------------------
-- USERS — 10 Professional Investor Personas
-- IDs start at 101 to avoid collision with any cached data
-- --------------------------------------------------------
INSERT INTO `users`
  (`id`, `username`, `firstname`, `surname`, `email`, `password`, `bio`,
   `joined`, `email_verified`, `account_type`,
   `instagram`, `twitter`, `facebook`, `github`, `website`, `phone`,
   `isOnline`, `lastOnline`)
VALUES
(101, 'quant_alpha',    'Arjun',  'Sharma',  'arjun@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Quantitative analyst. NIFTY derivatives & algo trading. 8 years on the Street.',
 '1680000000000', 'yes', 'public',
 'https://linkedin.com/in/arjunsharma', 'https://twitter.com/quant_alpha',
 '', 'https://github.com/arjun-quant', 'https://quant-alpha.in', '9876543210', 'yes', ''),

(102, 'macro_trader',   'Priya',  'Nair',    'priya@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Global macro investor. Rates, FX, and commodities. Ex-Goldman Sachs Mumbai.',
 '1680000100000', 'yes', 'public',
 'https://linkedin.com/in/priyanair', 'https://twitter.com/macro_trader',
 '', '', 'https://macrotrader.in', '9876543211', 'yes', ''),

(103, 'growth_capital', 'Rohan',  'Mehta',   'rohan@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Growth equity investor. Focused on Indian mid-cap tech and consumer brands.',
 '1680000200000', 'yes', 'public',
 'https://linkedin.com/in/rohanmehta', '', '', '', '', '9876543212', 'no', '1680500000000'),

(104, 'value_hunter',   'Sneha',  'Kapoor',  'sneha@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Deep value investor. Inspired by Graham & Buffett. Long-only equity portfolio.',
 '1680000300000', 'yes', 'public',
 'https://linkedin.com/in/snehakapoor', 'https://twitter.com/value_hunter',
 '', '', '', '9876543213', 'no', '1680600000000'),

(105, 'fintech_founder','Vikram', 'Bose',    'vikram@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Fintech entrepreneur. Built 2 startups. Angel investor in BFSI & payments.',
 '1680000400000', 'yes', 'public',
 'https://linkedin.com/in/vikrambose', 'https://twitter.com/fintech_founder',
 '', 'https://github.com/vikrambose', 'https://vikrambose.com', '9876543214', 'yes', ''),

(106, 'market_edge',    'Aisha',  'Khan',    'aisha@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Equity research analyst. Coverage: banking, NBFCs, and fintech disruptors.',
 '1680000500000', 'yes', 'public',
 'https://linkedin.com/in/aishakhan', 'https://twitter.com/market_edge',
 '', '', '', '9876543215', 'no', '1680700000000'),

(107, 'nifty_bull',     'Karan',  'Verma',   'karan@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Retail investor turned analyst. NIFTY 50 & ETF strategies for long-term wealth.',
 '1680000600000', 'yes', 'public',
 '', 'https://twitter.com/nifty_bull', '', '', '', '9876543216', 'no', '1680800000000'),

(108, 'ai_invest',      'Diya',   'Pillai',  'diya@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'AI/ML applied to portfolio management. Researching algorithmic strategies.',
 '1680000700000', 'yes', 'public',
 'https://linkedin.com/in/diyapillai', '', '', 'https://github.com/diya-ai',
 'https://ai-invest.in', '9876543217', 'yes', ''),

(109, 'debt_monk',      'Suresh', 'Rao',     'suresh@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'Fixed income specialist. G-Secs, corporate bonds, and credit analysis.',
 '1680000800000', 'yes', 'public',
 '', '', '', '', '', '9876543218', 'no', '1680900000000'),

(110, 'esg_alpha',      'Meera',  'Joshi',   'meera@finedge.io',
 '$2a$10$R/iWFCwEDgmOvg7mCB3wreerTC0hRuYyZflDN2Gyr3YV/ppMMNgJu',
 'ESG-focused long-term investor. Sustainable finance and impact investing.',
 '1680000900000', 'yes', 'public',
 'https://linkedin.com/in/meerajoshi', 'https://twitter.com/esg_alpha',
 '', '', '', '9876543219', 'no', '');

-- --------------------------------------------------------
-- FOLLOW GRAPH — realistic professional network
-- --------------------------------------------------------
INSERT INTO `follow_system`
  (`follow_id`, `follow_by`, `follow_by_username`, `follow_to`, `follow_to_username`, `follow_time`)
VALUES
(1,  101, 'quant_alpha',    102, 'macro_trader',    '1680100000000'),
(2,  101, 'quant_alpha',    105, 'fintech_founder', '1680100100000'),
(3,  101, 'quant_alpha',    108, 'ai_invest',       '1680100200000'),
(4,  101, 'quant_alpha',    106, 'market_edge',     '1680100300000'),
(5,  102, 'macro_trader',   101, 'quant_alpha',     '1680110000000'),
(6,  102, 'macro_trader',   104, 'value_hunter',    '1680110100000'),
(7,  102, 'macro_trader',   109, 'debt_monk',       '1680110200000'),
(8,  103, 'growth_capital', 101, 'quant_alpha',     '1680120000000'),
(9,  103, 'growth_capital', 105, 'fintech_founder', '1680120100000'),
(10, 103, 'growth_capital', 106, 'market_edge',     '1680120200000'),
(11, 104, 'value_hunter',   103, 'growth_capital',  '1680130000000'),
(12, 104, 'value_hunter',   107, 'nifty_bull',      '1680130100000'),
(13, 104, 'value_hunter',   109, 'debt_monk',       '1680130200000'),
(14, 105, 'fintech_founder',101, 'quant_alpha',     '1680140000000'),
(15, 105, 'fintech_founder',108, 'ai_invest',       '1680140100000'),
(16, 105, 'fintech_founder',106, 'market_edge',     '1680140200000'),
(17, 106, 'market_edge',    101, 'quant_alpha',     '1680150000000'),
(18, 106, 'market_edge',    102, 'macro_trader',    '1680150100000'),
(19, 106, 'market_edge',    105, 'fintech_founder', '1680150200000'),
(20, 107, 'nifty_bull',     104, 'value_hunter',    '1680160000000'),
(21, 107, 'nifty_bull',     106, 'market_edge',     '1680160100000'),
(22, 108, 'ai_invest',      101, 'quant_alpha',     '1680170000000'),
(23, 108, 'ai_invest',      105, 'fintech_founder', '1680170100000'),
(24, 109, 'debt_monk',      104, 'value_hunter',    '1680180000000'),
(25, 109, 'debt_monk',      102, 'macro_trader',    '1680180100000'),
(26, 110, 'esg_alpha',      104, 'value_hunter',    '1680190000000'),
(27, 110, 'esg_alpha',      106, 'market_edge',     '1680190100000'),
(28, 110, 'esg_alpha',      103, 'growth_capital',  '1680190200000');

-- --------------------------------------------------------
-- INVESTMENT CLUBS — 6 themed groups
-- --------------------------------------------------------
INSERT INTO `groups` (`group_id`, `name`, `bio`, `admin`, `group_type`, `created`)
VALUES
(101, 'Growth Investing',
 'Identifying high-growth companies in India and global emerging markets. Long-term conviction plays.',
 103, 'public', '1680200000000'),

(102, 'Fintech Disruptors',
 'Analyzing how technology is reshaping banking, payments, lending, and wealth management in India.',
 105, 'public', '1680200100000'),

(103, 'AI & Markets',
 'Exploring machine learning applications in quantitative finance and algorithmic trading strategies.',
 108, 'public', '1680200200000'),

(104, 'Long-Term Wealth Builders',
 'Conservative strategies for capital preservation and compounding over 10+ year investment horizons.',
 104, 'public', '1680200300000'),

(105, 'Indian Equity Research',
 'Deep-dive fundamental and technical analysis on NSE/BSE listed companies across all market caps.',
 106, 'public', '1680200400000'),

(106, 'Global Macro Club',
 'Macro-economic research: FX, rates, commodities, and geopolitical risk. For serious macro traders.',
 102, 'private', '1680200500000');

-- Group members (creator is always first member)
INSERT INTO `group_members` (`grp_member_id`, `group_id`, `member`, `added_by`, `joined_group`)
VALUES
(1,  101, 103, 103, '1680200000001'),
(2,  101, 101, 103, '1680201000000'),
(3,  101, 106, 103, '1680202000000'),
(4,  101, 107, 103, '1680203000000'),
(5,  102, 105, 105, '1680200100001'),
(6,  102, 101, 105, '1680201100000'),
(7,  102, 108, 105, '1680202100000'),
(8,  102, 106, 105, '1680203100000'),
(9,  103, 108, 108, '1680200200001'),
(10, 103, 101, 108, '1680201200000'),
(11, 103, 105, 108, '1680202200000'),
(12, 104, 104, 104, '1680200300001'),
(13, 104, 107, 104, '1680201300000'),
(14, 104, 109, 104, '1680202300000'),
(15, 104, 110, 104, '1680203300000'),
(16, 105, 106, 106, '1680200400001'),
(17, 105, 101, 106, '1680201400000'),
(18, 105, 102, 106, '1680202400000'),
(19, 105, 103, 106, '1680203400000'),
(20, 106, 102, 102, '1680200500001'),
(21, 106, 101, 102, '1680201500000'),
(22, 106, 109, 102, '1680202500000');

-- --------------------------------------------------------
-- POSTS — 20 Market Insights
-- imgSrc: reusing existing files from dist/posts/
-- --------------------------------------------------------
INSERT INTO `posts` (`post_id`, `user`, `description`, `imgSrc`, `filter`, `location`, `type`, `group_id`, `post_time`, `sentiment`)
VALUES
(101, 101,
 'NIFTY 50 broke through 22,500 resistance today on strong FII buying. Watch for a consolidation before the next leg up. #NIFTY #equity',
 'instagram_1516522776339.jpg', 'filter-normal', 'Mumbai, India', 'user', 0, '1680300000000', 'bullish'),

(102, 102,
 'The Fed pause narrative is weakening. 10Y UST yields pushing toward 5%. Emerging market debt could see significant outflows in Q3. #rates #macro',
 'instagram_1516523468369.jpg', 'filter-normal', 'New Delhi, India', 'user', 0, '1680300100000', 'bearish'),

(103, 103,
 'HDFC Bank Q4 results strong — NIM expansion and controlled NPA. Retail lending growth at 18% YoY. Bullish on the stock at current valuations. #HDFC #banking',
 'instagram_1516523813005.jpg', 'filter-normal', 'Bengaluru, India', 'user', 0, '1680300200000', 'bullish'),

(104, 104,
 'P/E compression is coming for overvalued mid-caps. The margin of safety principle matters more now than ever. Patience is the real edge. #valueinvesting',
 'instagram_1516524010087.jpg', 'filter-normal', 'Pune, India', 'user', 0, '1680300300000', 'neutral'),

(105, 105,
 'UPI transaction volume crossed 14 billion in March 2024. The infrastructure is ready — India may become one of the world''s strongest fintech exporters. #UPI #fintech',
 'instagram_1516524031664.jpg', 'filter-normal', 'Hyderabad, India', 'user', 0, '1680300400000', 'bullish'),

(106, 106,
 'Axis Bank''s digital transformation remains underappreciated. Tech spend up 22%, mobile MAU growing 35% YoY. Upgrading to outperform. #AxisBank #equity',
 'instagram_1516524056911.jpg', 'filter-normal', 'Chennai, India', 'user', 0, '1680300500000', 'bullish'),

(107, 107,
 'SIP inflows hit ₹19,270 crore in March 2024. Retail participation in equities has structurally shifted. NIFTY ETFs remain the cleanest long-term vehicle. #SIP #ETF',
 'instagram_1516524098767.jpg', 'filter-normal', 'Kolkata, India', 'user', 0, '1680300600000', 'bullish'),

(108, 108,
 'Backtesting a momentum + mean reversion hybrid model on NSE data 2015-2024. Sharpe ratio 1.8 vs 0.9 for buy-and-hold. Full write-up coming this week. #quant #algo',
 'instagram_1516524133694.jpg', 'filter-normal', 'Bengaluru, India', 'user', 0, '1680300700000', 'neutral'),

(109, 109,
 '10Y G-Sec yield at 7.1% offers attractive real returns with RBI inflation target at 4%. Government bonds are underweighted in most retail portfolios right now. #gsec',
 'instagram_1516524190576.jpg', 'filter-normal', 'Mumbai, India', 'user', 0, '1680300800000', 'bullish'),

(110, 110,
 'Tata Power''s renewable energy segment now contributing 30% of revenue. ESG-aligned investors should have this on their radar. Strong long-term thesis. #ESG #TataPower',
 'instagram_1516524753923.jpg', 'filter-normal', 'Mumbai, India', 'user', 0, '1680300900000', 'bullish'),

(111, 101,
 'Options data showing massive Put writing at 22,000 strike — strong support zone identified. IV crush post-budget creates an interesting buying opportunity. #options',
 'instagram_1516524981153.jpg', 'filter-normal', '', 'user', 0, '1680301000000', 'bullish'),

(112, 102,
 'DXY holding above 104 spells trouble for gold and EM FX. INR could test 84 if capital flows reverse. Positioning defensively. #FX #macro #DXY',
 'instagram_1516525040077.jpg', 'filter-normal', '', 'user', 0, '1680301100000', 'bearish'),

(113, 103,
 'Zomato''s unit economics have structurally improved — contribution margin positive for 6 consecutive quarters. Market is still pricing in early-stage risk. #Zomato',
 'instagram_1516525129889.jpg', 'filter-normal', '', 'user', 0, '1680301200000', 'bullish'),

(114, 105,
 'AI-driven credit underwriting is the most interesting opportunity in Indian fintech right now. Lenders using ML models are showing 40% lower NPA rates. #fintech #AI',
 'instagram_1516525289046.jpg', 'filter-normal', '', 'user', 0, '1680301300000', 'bullish'),

(115, 106,
 'ICICI Bank vs HDFC Bank — ICICI has closed the ROE gap meaningfully since 2020. Both are strong holds at 15-20% discount to fair value. Long both. #ICICI #HDFC',
 'instagram_1516525555814.jpg', 'filter-normal', '', 'user', 0, '1680301400000', 'neutral'),

(116, 104,
 'Coal India trading at 4x earnings with a 9% dividend yield. Classic deep value setup that most investors overlook due to ESG screening. #coalindia #dividends #value',
 'instagram_1516525648412.jpg', 'filter-normal', '', 'user', 0, '1680301500000', 'bullish'),

(117, 108,
 'Sentiment analysis on NSE earnings calls shows 73% bullish management tone in Q4 FY24 vs 61% in Q4 FY23. Using NLP as a leading indicator is underexplored. #NLP #quant',
 'instagram_1516525703299.jpg', 'filter-normal', '', 'group', 103, '1680301600000', 'neutral'),

(118, 102,
 'Brent crude holding $85-90 range. Iran tensions premium still priced in. Long energy equities as a macro hedge makes strategic sense in this environment. #oil #macro',
 'instagram_1516527391527.jpg', 'filter-normal', '', 'group', 106, '1680301700000', 'bullish'),

(119, 103,
 'IPO pipeline for FY25 is strong — NTPC Green, HDB Financial, and Swiggy expected to list. Growth investors should monitor anchor allocation windows closely. #IPO',
 'instagram_1516527403042.jpg', 'filter-normal', '', 'user', 0, '1680301800000', 'bullish'),

(120, 110,
 'India''s green bond market grew 4x in 2023. International ESG capital is looking for credible domestic instruments. This is a structural multi-decade opportunity. #greenbonds',
 'instagram_1516527804372.jpg', 'filter-normal', '', 'user', 0, '1680301900000', 'bullish');

-- --------------------------------------------------------
-- HASHTAGS — extracted from post descriptions
-- --------------------------------------------------------
INSERT INTO `hashtags` (`hashtag_id`, `hashtag`, `post_id`, `user`, `hashtag_time`)
VALUES
(101, '#NIFTY',          101, 101, '1680300000001'),
(102, '#equity',         101, 101, '1680300000002'),
(103, '#rates',          102, 102, '1680300100001'),
(104, '#macro',          102, 102, '1680300100002'),
(105, '#HDFC',           103, 103, '1680300200001'),
(106, '#banking',        103, 103, '1680300200002'),
(107, '#valueinvesting', 104, 104, '1680300300001'),
(108, '#UPI',            105, 105, '1680300400001'),
(109, '#fintech',        105, 105, '1680300400002'),
(110, '#AxisBank',       106, 106, '1680300500001'),
(111, '#equity',         106, 106, '1680300500002'),
(112, '#SIP',            107, 107, '1680300600001'),
(113, '#ETF',            107, 107, '1680300600002'),
(114, '#quant',          108, 108, '1680300700001'),
(115, '#algo',           108, 108, '1680300700002'),
(116, '#gsec',           109, 109, '1680300800001'),
(117, '#ESG',            110, 110, '1680300900001'),
(118, '#TataPower',      110, 110, '1680300900002'),
(119, '#options',        111, 101, '1680301000001'),
(120, '#FX',             112, 102, '1680301100001'),
(121, '#macro',          112, 102, '1680301100002'),
(122, '#DXY',            112, 102, '1680301100003'),
(123, '#fintech',        114, 105, '1680301300001'),
(124, '#AI',             114, 105, '1680301300002'),
(125, '#ICICI',          115, 106, '1680301400001'),
(126, '#HDFC',           115, 106, '1680301400002'),
(127, '#banking',        115, 106, '1680301400003'),
(128, '#coalindia',      116, 104, '1680301500001'),
(129, '#dividends',      116, 104, '1680301500002'),
(130, '#value',          116, 104, '1680301500003'),
(131, '#NLP',            117, 108, '1680301600001'),
(132, '#quant',          117, 108, '1680301600002'),
(133, '#oil',            118, 102, '1680301700001'),
(134, '#macro',          118, 102, '1680301700002'),
(135, '#IPO',            119, 103, '1680301800001'),
(136, '#greenbonds',     120, 110, '1680301900001'),
(137, '#ESG',            120, 110, '1680301900002');

-- --------------------------------------------------------
-- LIKES — realistic engagement on posts
-- --------------------------------------------------------
INSERT INTO `likes` (`like_id`, `post_id`, `like_by`, `like_time`)
VALUES
-- Post 101 (NIFTY) — 5 likes
(101, 101, 102, '1680310000000'), (102, 101, 103, '1680310001000'),
(103, 101, 105, '1680310002000'), (104, 101, 108, '1680310003000'),
(105, 101, 107, '1680310004000'),
-- Post 102 (Fed/rates) — 3 likes
(106, 102, 101, '1680311000000'), (107, 102, 109, '1680311001000'),
(108, 102, 104, '1680311002000'),
-- Post 103 (HDFC) — 5 likes
(109, 103, 101, '1680312000000'), (110, 103, 106, '1680312001000'),
(111, 103, 107, '1680312002000'), (112, 103, 104, '1680312003000'),
(113, 103, 110, '1680312004000'),
-- Post 104 (value investing) — 2 likes
(114, 104, 102, '1680313000000'), (115, 104, 107, '1680313001000'),
-- Post 105 (UPI) — 6 likes
(116, 105, 101, '1680314000000'), (117, 105, 103, '1680314001000'),
(118, 105, 106, '1680314002000'), (119, 105, 108, '1680314003000'),
(120, 105, 110, '1680314004000'), (121, 105, 107, '1680314005000'),
-- Post 106 (Axis Bank) — 3 likes
(122, 106, 101, '1680315000000'), (123, 106, 102, '1680315001000'),
(124, 106, 105, '1680315002000'),
-- Post 107 (SIP) — 2 likes
(125, 107, 104, '1680316000000'), (126, 107, 106, '1680316001000'),
-- Post 108 (quant model) — 4 likes
(127, 108, 101, '1680317000000'), (128, 108, 105, '1680317001000'),
(129, 108, 103, '1680317002000'), (130, 108, 102, '1680317003000'),
-- Post 109 (G-Sec) — 2 likes
(131, 109, 104, '1680318000000'), (132, 109, 102, '1680318001000'),
-- Post 110 (Tata Power ESG) — 3 likes
(133, 110, 104, '1680319000000'), (134, 110, 103, '1680319001000'),
(135, 110, 106, '1680319002000'),
-- Post 114 (AI credit) — 4 likes
(136, 114, 101, '1680322000000'), (137, 114, 103, '1680322001000'),
(138, 114, 108, '1680322002000'), (139, 114, 106, '1680322003000'),
-- Post 115 (ICICI vs HDFC) — 3 likes
(140, 115, 101, '1680323000000'), (141, 115, 103, '1680323001000'),
(142, 115, 107, '1680323002000'),
-- Post 117 (NLP sentiment) — 3 likes
(143, 117, 101, '1680324000000'), (144, 117, 105, '1680324001000'),
(145, 117, 102, '1680324002000'),
-- Post 119 (IPO) — 3 likes
(146, 119, 103, '1680325000000'), (147, 119, 105, '1680325001000'),
(148, 119, 106, '1680325002000'),
-- Post 120 (green bonds) — 3 likes
(149, 120, 104, '1680326000000'), (150, 120, 103, '1680326001000'),
(151, 120, 106, '1680326002000');

-- --------------------------------------------------------
-- COMMENTS — professional investor discussion
-- --------------------------------------------------------
INSERT INTO `comments` (`comment_id`, `type`, `text`, `commentSrc`, `comment_by`, `post_id`, `comment_time`)
VALUES
(101, 'text', 'Strong technical setup. Volume profile confirms institutional accumulation at this level. Watch for 23,000 next.', '', 102, 101, '1680310010000'),
(102, 'text', 'PCR ratio also supportive at 1.3. Bulls firmly in control short-term.', '', 108, 101, '1680310020000'),
(103, 'text', 'The rate differential between US and India makes EM capital outflow risk very real. Watching USD/INR closely.', '', 101, 102, '1680311010000'),
(104, 'text', 'RBI forex reserves at $640B provide a strong buffer. Managed float should hold the 84 line.', '', 109, 102, '1680311020000'),
(105, 'text', 'HDFC CASA ratio improvement is the real story here. Lower cost of funds translates directly to sustainable NIM expansion.', '', 102, 103, '1680312010000'),
(106, 'text', 'Their rural banking push is building a moat that private competitors cannot replicate quickly.', '', 107, 103, '1680312020000'),
(107, 'text', 'Margin of safety is underrated right now. Most retail investors are ignoring downside risk in this euphoric environment.', '', 102, 104, '1680313010000'),
(108, 'text', 'UPI stack is genuinely world-class. Brazil PIX was directly inspired by it. India has a real infrastructure export product here.', '', 101, 105, '1680314010000'),
(109, 'text', 'PhonePe and NPCI partnerships could unlock B2B cross-border payments. The TAM is enormous.', '', 108, 105, '1680314020000'),
(110, 'text', 'ICICI is closing fast on HDFC in digital capabilities. Most interesting banking rivalry to watch over next 3 years.', '', 103, 106, '1680315010000'),
(111, 'text', 'What lookback period are you using for the momentum signal in the hybrid model?', '', 101, 108, '1680317010000'),
(112, 'text', '90-day for momentum, 20-day for mean reversion trigger. Full details in the write-up this week.', '', 108, 108, '1680317020000'),
(113, 'text', 'Real yields on G-Secs are among the best in EM universe right now. Duration risk is very manageable with RBI on hold.', '', 102, 109, '1680318010000'),
(114, 'text', 'Tata Power renewable premium multiple is justified globally. Most Indian investors still discount it incorrectly.', '', 103, 110, '1680319010000'),
(115, 'text', 'Which lenders are publishing the NPA comparison data? Lendingkart or CredAvenue?', '', 101, 114, '1680322010000'),
(116, 'text', 'Some public data from Lendingkart and IIM Ahmedabad research. Also CRISIL has a note on this.', '', 105, 114, '1680322020000'),
(117, 'text', 'ESG screening is systematically creating value gaps in traditional sectors. Coal India is the textbook example.', '', 110, 116, '1680323010000'),
(118, 'text', 'Anchor allocation windows for NTPC Green will be watched very closely. Strong institutional interest expected.', '', 106, 119, '1680325010000');

-- --------------------------------------------------------
-- NOTIFICATIONS — activity feed for demo
-- --------------------------------------------------------
INSERT INTO `notifications`
  (`notify_id`, `notify_by`, `notify_to`, `post_id`, `group_id`, `type`, `user`, `notify_time`, `status`)
VALUES
(101, 102, 101, 101,  0, 'like',           0, '1680310000100', 'read'),
(102, 103, 101, 101,  0, 'like',           0, '1680310001100', 'read'),
(103, 102, 101, 101,  0, 'comment',        0, '1680310010100', 'unread'),
(104, 101, 102, 102,  0, 'like',           0, '1680311000100', 'read'),
(105, 101, 102, 102,  0, 'comment',        0, '1680311010100', 'unread'),
(106, 102, 103, 103,  0, 'like',           0, '1680312000100', 'read'),
(107, 106, 103, 103,  0, 'like',           0, '1680312001100', 'read'),
(108, 101, 105, 105,  0, 'like',           0, '1680314000100', 'unread'),
(109, 103, 105, 105,  0, 'like',           0, '1680314001100', 'unread'),
(110, 101, 105, 105,  0, 'comment',        0, '1680314010100', 'unread'),
(111, 101, 106, 106,  0, 'like',           0, '1680315000100', 'read'),
(112, 102, 106, 106,  0, 'like',           0, '1680315001100', 'read'),
(113, 101, 108, 108,  0, 'like',           0, '1680317000100', 'read'),
(114, 101, 108, 108,  0, 'comment',        0, '1680317010100', 'unread'),
(115, 102, 101,   0,  0, 'follow',         0, '1680110000100', 'read'),
(116, 103, 101,   0,  0, 'follow',         0, '1680120000100', 'read'),
(117, 105, 101,   0,  0, 'follow',         0, '1680140000100', 'read'),
(118, 101, 102,   0,  0, 'follow',         0, '1680100000100', 'read'),
(119, 103, 105,   0, 102, 'add_grp_member',0, '1680202100100', 'unread'),
(120, 108, 105,   0, 103, 'add_grp_member',0, '1680202200100', 'unread');

-- --------------------------------------------------------
-- CONVERSATIONS & MESSAGES
-- --------------------------------------------------------
INSERT INTO `conversations` (`con_id`, `user_one`, `user_two`, `con_time`)
VALUES
(101, 101, 105, '1680400000000'),
(102, 102, 109, '1680400100000'),
(103, 103, 106, '1680400200000');

INSERT INTO `messages`
  (`message_id`, `con_id`, `mssg_by`, `mssg_to`, `message`, `type`, `status`, `message_time`)
VALUES
(101, 101, 105, 101,
 'Great analysis on UPI cross-border payments. Would love to collaborate on a detailed research note together.',
 'text', 'read', '1680400010000'),
(102, 101, 101, 105,
 'Absolutely. I have some proprietary data on NPCI transaction flows. Let us sync up this week.',
 'text', 'unread', '1680400020000'),
(103, 102, 102, 109,
 'Your G-Sec analysis was spot on. The duration extension trade worked well through April.',
 'text', 'read', '1680400110000'),
(104, 102, 109, 102,
 'Glad it was useful. With RBI on hold, the 10Y could rally another 20-30bps from here.',
 'text', 'unread', '1680400120000'),
(105, 103, 106, 103,
 'The HDFC vs ICICI comparison was excellent. Would you mind sharing the DCF model assumptions?',
 'text', 'read', '1680400210000'),
(106, 103, 103, 106,
 'Sure, will share the spreadsheet. It is a 3-stage DCF with varying terminal growth rates by segment.',
 'text', 'unread', '1680400220000');

-- --------------------------------------------------------
-- PROFILE TAGS — investor style keywords
-- --------------------------------------------------------
INSERT INTO `tags` (`tag_id`, `user`, `tag`)
VALUES
(101, 101, 'derivatives'),    (102, 101, 'algo-trading'),   (103, 101, 'NIFTY'),
(104, 102, 'macro'),          (105, 102, 'FX'),             (106, 102, 'rates'),
(107, 103, 'growth-equity'),  (108, 103, 'mid-cap'),        (109, 103, 'IPO'),
(110, 104, 'value'),          (111, 104, 'Buffett'),        (112, 104, 'long-only'),
(113, 105, 'fintech'),        (114, 105, 'payments'),       (115, 105, 'angel'),
(116, 106, 'banking'),        (117, 106, 'NBFC'),           (118, 106, 'equity-research'),
(119, 107, 'ETF'),            (120, 107, 'SIP'),            (121, 107, 'NIFTY50'),
(122, 108, 'ML'),             (123, 108, 'quant'),          (124, 108, 'backtesting'),
(125, 109, 'bonds'),          (126, 109, 'G-Sec'),          (127, 109, 'credit'),
(128, 110, 'ESG'),            (129, 110, 'sustainable'),    (130, 110, 'impact');

-- --------------------------------------------------------
-- AUTO_INCREMENT resets — must be above current data IDs
-- --------------------------------------------------------
ALTER TABLE `users`         AUTO_INCREMENT = 200;
ALTER TABLE `follow_system` AUTO_INCREMENT = 200;
ALTER TABLE `groups`        AUTO_INCREMENT = 200;
ALTER TABLE `group_members` AUTO_INCREMENT = 200;
ALTER TABLE `posts`         AUTO_INCREMENT = 200;
ALTER TABLE `hashtags`      AUTO_INCREMENT = 200;
ALTER TABLE `likes`         AUTO_INCREMENT = 200;
ALTER TABLE `comments`      AUTO_INCREMENT = 200;
ALTER TABLE `notifications` AUTO_INCREMENT = 200;
ALTER TABLE `conversations` AUTO_INCREMENT = 200;
ALTER TABLE `messages`      AUTO_INCREMENT = 200;
ALTER TABLE `tags`          AUTO_INCREMENT = 200;
ALTER TABLE `post_tags`     AUTO_INCREMENT = 200;
ALTER TABLE `shares`        AUTO_INCREMENT = 200;
ALTER TABLE `bookmarks`     AUTO_INCREMENT = 200;
