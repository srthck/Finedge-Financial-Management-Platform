# FinEdge
### Social Intelligence for Modern Investors

A full-featured investor community platform — share investment insights, follow market leaders, discover opportunities, and build your investor network.

---

## Tech Stack

- **Frontend**: React 16, Redux, React Router
- **Backend**: Node.js, Express 4
- **Database**: MySQL
- **Auth**: Session-based (client-sessions)
- **Build**: Webpack 4 + Babel 6
- **Styles**: Custom SCSS (dark fintech theme)
- **Testing**: Jest + Enzyme

---

## Features

- 📊 Insight Feed — posts from investors you follow
- 🔍 Market Discover — explore investors, insights, and Investment Clubs
- 💬 Investor Messages — 1:1 direct messaging with text, images, stickers
- 🔔 Market Alerts — 14 notification types (follows, likes, mentions, shares...)
- 👥 Investment Clubs — public/private groups for investment themes
- 🏷️ Cashtags — hashtag-style tagging for financial topics
- 🔖 Watchlists — bookmark insights for later
- 🧑‍💼 Investor Profile — bio, social links, post history, tags
- ⚙️ Settings — password change, account type, deactivation
- 🔐 Admin Panel — password-protected admin dashboard

---

## Setup

### Requirements
- Node.js
- MySQL / MariaDB
- [GraphicsMagick](http://www.graphicsmagick.org/) (for image processing)

### Installation

```bash
npm install
```

### Database
1. Create a MySQL database
2. Import `db.sql`

### Environment Variables
Create a `.env` file:

```
PORT=3000
SESSION_SECRET_LETTER="your-secret"
MYSQL_HOST="localhost"
MYSQL_USER="root"
MYSQL_PASSWORD="password"
MYSQL_DATABASE="finedge"
MAIL="your-email@gmail.com"
MAIL_PASSWORD="your-email-password"
GOOGLE_GEOLOCATION_KEY="your-google-key"
ADMIN_PASSWORD="admin-password"
```

### Run

```bash
# Start backend server
npm start

# In a separate terminal — build frontend bundle
npm run dev
```

Then visit `http://localhost:3000`

---

## Acknowledgements & Project Origins

FinEdge is built upon the open-source [React-Instagram-Clone-2.0](https://github.com/yTakkar/React-Instagram-Clone-2.0) project originally developed by yTakkar and contributors. We respect and appreciate the work of the original authors. 

While preserving the core social features of the original codebase, FinEdge has undergone a complete transformation into a specialized social platform for modern investors. Major modifications and extensions include:
- **FinEdge Branding**: Redefined the visual identity and platform focus specifically around finance and investment.
- **Premium UI**: Designed a sleek, dark-themed fintech dashboard with modern typography, polished cards, and custom components to suit professional investors.
- **Investment Clubs**: Redesigned the group mechanism into Investment Clubs tailored for thematic investing discussions, group research, and sharing.
- **Watchlists & Sentiment System**: Implemented post bookmarking as asset Watchlists, along with a user sentiment classification system (Bullish/Bearish/Neutral tags) for asset discussions.
- **Trending Insights & Cashtags**: Enhanced the hashtags system to function as financial cashtags and trending topics.
- **Finance Demo Data**: Pre-populated migration/demo scripts (`finedge-demo-data.sql`) to reflect active investor conversations, financial ticker symbols, and realistic trading discussions.

FinEdge honors the original project's MIT license and operates in full transparency regarding its foundation.

---

## License
ISC
