# FinEdge

### Social Intelligence Platform for Modern Investors

FinEdge is a full-stack fintech community platform designed to help investors discover market insights, participate in investment-focused communities, track high-signal discussions, and build professional investor networks.

Unlike traditional social platforms, FinEdge focuses on investment intelligence, sentiment-driven discussions, thematic investment clubs, and financial knowledge sharing.

---

## Live Demo



**GitHub Repository:** [Add Repository Link]

---

## SCREENSHOTS
## Application Screenshots

### Login Page
![Login Page](screenshots/login-page.png)

### Signup Page
![Signup Page](screenshots/signup-page.png)

### Home Feed
![Home Feed](screenshots/home-feed.png)

### Market Discover
![Market Discover](screenshots/market-discover.png)

### Investor Profile
![Investor Profile](screenshots/investor-profile.png)

### Investment Club
![Investment Club](screenshots/investment-club.png)

### Profile Settings
![Profile Settings](screenshots/profile-settings.png)

## Project Overview

Financial communities generate enormous amounts of valuable information, but most platforms are either:

* Generic social networks not designed for investors
* Market tools lacking community-driven intelligence
* Forums with poor discovery and engagement mechanisms

FinEdge bridges this gap by combining:

* Investor networking
* Market insight sharing
* Community-driven investment discussions
* Sentiment analysis
* Watchlists
* Investment clubs
* Discovery systems

into a unified platform.

---

## Key Highlights

### Investor-Centric Social Layer

Connect with investors, build a network, discover market participants, and engage with high-quality financial discussions.

### Investment Clubs

Create and join thematic investment communities focused on:

* Growth Investing
* FinTech
* AI & Markets
* Value Investing
* Macroeconomics
* Emerging Technologies

### Market Sentiment System

Every insight can be classified as:

* ▲ Bullish
* ▼ Bearish
* ● Neutral

allowing users to quickly understand community sentiment.

### Trending Insights Engine

Automatically surfaces high-engagement investment discussions based on community activity.

### Watchlists

Save and organize valuable insights for future research and monitoring.

### Investor Messaging

Private messaging system supporting:

* Text
* Images
* Stickers

for direct investor communication.

### Market Alerts

Real-time notifications for:

* Likes
* Comments
* Mentions
* Shares
* Follows
* Community activity

---

## Screenshots

### Home Feed

![Home Feed](screenshots/home-feed.png)

### Investor Profile

![Investor Profile](screenshots/profile.png)

### Investment Clubs

![Investment Clubs](screenshots/clubs.png)

### Trending Insights

![Trending Insights](screenshots/trending.png)

### Market Discover

![Market Discover](screenshots/discover.png)

### Create Insight & Sentiment Selection

![Sentiment System](screenshots/sentiment.png)

---

## System Architecture

```text
React + Redux Frontend
          │
          ▼
Express.js REST API
          │
          ▼
MySQL Database
          │
          ▼
Media Storage & Processing
```

### Core Modules

* Authentication & Session Management
* Investor Profiles
* Insight Feed
* Investment Clubs
* Watchlists
* Messaging
* Market Alerts
* Search & Discovery
* Trending Insights
* Sentiment Classification

---

## Technology Stack

### Frontend

* React 16
* Redux
* React Router
* SCSS
* Webpack

### Backend

* Node.js
* Express.js

### Database

* MySQL
* MariaDB Compatible

### Authentication

* Session-Based Authentication
* Protected Routes

### Testing

* Jest
* Enzyme

---

## Premium UI System

The platform was redesigned using a fintech-focused design language inspired by modern SaaS products.

### Design Principles

* Dark fintech dashboard aesthetic
* Premium card system
* Inter typography
* Consistent spacing hierarchy
* Market sentiment visual indicators
* High information density with readability

### Theme Tokens

```text
Background      #0B0F19
Surface         #131A2A
Accent          #22C55E
Info            #38BDF8
Bullish         #22C55E
Bearish         #EF4444
Neutral         #64748B
```

---

## Features

| Feature           | Description                           |
| ----------------- | ------------------------------------- |
| Insight Feed      | Personalized investor content feed    |
| Market Discover   | Discover investors and communities    |
| Investment Clubs  | Public and private investor groups    |
| Sentiment System  | Bullish, Bearish, Neutral insights    |
| Trending Insights | Community-driven discovery engine     |
| Watchlists        | Save valuable market insights         |
| Direct Messaging  | Investor-to-investor communication    |
| Market Alerts     | Engagement and activity notifications |
| Investor Profiles | Detailed investor identity system     |
| Search System     | Search users, clubs and content       |
| Admin Dashboard   | Administrative controls               |

---

## Local Setup

### Requirements

* Node.js
* MySQL or MariaDB
* GraphicsMagick

### Installation

```bash
npm install
```

### Database Setup

Create a database and import:

```bash
db.sql
```

Optional:

```bash
finedge-demo-data.sql
```

to populate the platform with investor-focused sample data.

### Environment Variables

```env
PORT=3000

SESSION_SECRET_LETTER=your-secret

MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=password
MYSQL_DATABASE=finedge

MAIL=your-email@gmail.com
MAIL_PASSWORD=your-password

GOOGLE_GEOLOCATION_KEY=your-key

ADMIN_PASSWORD=your-admin-password
```

### Start Application

Backend:

```bash
npm start
```

Frontend Build:

```bash
npm run dev
```

Application:

```text
http://localhost:3000
```

---

## Engineering Improvements Implemented

The original codebase was transformed into a finance-focused platform through substantial architectural and product-level modifications.

### Product Transformation

* Rebranded into FinEdge
* Redesigned user journeys around investors
* Introduced investment-focused terminology
* Added market sentiment classification
* Added investment clubs
* Added watchlists
* Added trending insights
* Added finance-oriented demo ecosystem

### User Experience Improvements

* Premium fintech dark theme
* Improved card architecture
* Enhanced typography system
* Professional empty states
* Consistent visual hierarchy
* Investor-focused discovery flows

---

## Acknowledgements

FinEdge was built upon the open-source React-Instagram-Clone-2.0 project created by yTakkar and contributors.

The original project served as a technical foundation, while FinEdge introduces significant product, design, branding, and feature transformations to support a specialized fintech investor community experience.

All original licensing terms are respected and acknowledged.

---

## Future Roadmap

Potential future enhancements:

* Portfolio Tracking
* Asset-Specific Discussion Hubs
* Market Data Integrations
* Advanced Search & Filtering
* Reputation Scoring System
* Community Analytics
* Investor Verification System

---

## License

Please refer to the repository license file for licensing information.
