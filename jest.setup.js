import { configure } from 'enzyme'
import Adapter from 'enzyme-adapter-react-16'

configure({
  adapter: new Adapter(),
})

jest.mock('nodemailer', () => ({
  createTransport: () => ({
    sendMail: (options, callback) => {
      callback(null, 'Mail Sent!!')
    },
  }),
}))

jest.mock('mysql2', () => {
  return {
    createConnection: () => {
      const connection = {
        connect: (cb) => {
          if (cb) cb(null)
        },
        on: () => {},
        query: (sql, values, callback) => {
          if (typeof values === 'function') {
            callback = values
            values = []
          }

          let res = []
          const normSql = sql.replace(/\s+/g, ' ').trim()

          // db.test.js: SELECT username, email
          if (normSql.includes('SELECT username, email FROM users WHERE id=?')) {
            res = [{ email: 'takkar@gmail.com', username: 'takkar' }]
          }
          // user.test.js: create_user
          else if (normSql.includes('INSERT INTO users SET ?')) {
            res = { insertId: 24, affectedRows: 1 }
          }
          // user.test.js: afterAll delete
          else if (normSql.includes('DELETE FROM users WHERE id=?')) {
            res = { affectedRows: 1 }
          }
          // user.test.js: change_password
          else if (normSql.includes('UPDATE users SET password=? WHERE id=?')) {
            res = { affectedRows: 1 }
          }
          // user.test.js: isFollowing — alias is_following
          else if (normSql.includes('COUNT(follow_id) AS is_following')) {
            res = [{ is_following: 1 }]
          }
          // user.test.js: favouriteOrNot — alias fav_count
          else if (normSql.includes('COUNT(fav_id) AS fav_count')) {
            res = [{ fav_count: 1 }]
          }
          // user.test.js: isBlocked — alias block_count
          else if (normSql.includes('COUNT(block_id) AS block_count')) {
            res = [{ block_count: 0 }]
          }
          // user.test.js: mutualUsers — follow_system queries
          else if (normSql.includes('follow_system.follow_id')) {
            res = [{ follow_id: 1, user: 7, username: 'ghalib', firstname: 'Mirza', surname: 'Ghalib' }]
          }
          else if (normSql.includes('follow_system.follow_by AS user')) {
            res = [{ follow_id: 2, user: 7, username: 'ghalib', firstname: 'Mirza', surname: 'Ghalib' }]
          }
          // user.test.js: getId — SELECT id FROM users
          else if (normSql.includes('SELECT id FROM users WHERE username=?')) {
            res = [{ id: 7 }]
          }
          // user.test.js: getWhat — SELECT <field> FROM users — dynamic column
          else if (normSql.match(/SELECT \w+ FROM users WHERE id=\? LIMIT 1/)) {
            const match = normSql.match(/SELECT (\w+) FROM users/)
            const col = match ? match[1] : null
            if (col === 'firstname') res = [{ firstname: 'iam_' }]
            else if (col === 'surname') res = [{ surname: 'takkar' }]
            else res = [{}]
          }
          // group.test.js: getWhatOfGrp — dynamic SELECT <field> FROM `groups`
          else if (normSql.match(/SELECT \w+ FROM `groups` WHERE group_id=\?/)) {
            const match = normSql.match(/SELECT (\w+) FROM `groups`/)
            const col = match ? match[1] : null
            if (col === 'group_type') res = [{ group_type: 'public' }]
            else res = [{}]
          }
          // group.test.js: joinedGroup — alias joined
          else if (normSql.includes('COUNT(grp_member_id) AS joined')) {
            res = [{ joined: 1 }]
          }
          // group.test.js: mutualGroupMembers — follow_system followings
          else if (normSql.includes('follow_system.follow_to AS user')) {
            res = [{ user: 24, username: 'takkar' }]
          }
          // group.test.js: mutualGroupMembers — group_members
          else if (normSql.includes('group_members.member AS user')) {
            res = [{ user: 24, username: 'takkar' }]
          }
          // post.test.js: likedOrNot — alias l
          else if (normSql.includes('COUNT(like_id) AS l FROM likes')) {
            res = [{ l: 1 }]
          }
          // post.test.js: bookmarkedOrNot — alias b
          else if (normSql.includes('COUNT(bkmrk_id) AS b FROM bookmarks')) {
            res = [{ b: 1 }]
          }
          // post.test.js: isPostMine — SELECT user FROM posts
          else if (normSql.includes('SELECT user FROM posts WHERE post_id=?')) {
            res = [{ user: 24 }]
          }
          // post.test.js: didIShare — alias post_share
          else if (normSql.includes('COUNT(share_id) AS post_share FROM shares')) {
            res = [{ post_share: 1 }]
          }
          // post.test.js: getCounts — tags_count
          else if (normSql.includes('COUNT(post_tag_id) AS tags_count')) {
            res = [{ tags_count: 1 }]
          }
          // post.test.js: getCounts — likes_count
          else if (normSql.includes('COUNT(like_id) AS likes_count')) {
            res = [{ likes_count: 1 }]
          }
          // post.test.js: getCounts — shares_count
          else if (normSql.includes('COUNT(share_id) AS shares_count')) {
            res = [{ shares_count: 1 }]
          }
          // post.test.js: getCounts — comments_count
          else if (normSql.includes('COUNT(comment_id) AS comments_count')) {
            res = [{ comments_count: 1 }]
          }
          // message.test.js: getLastMssgTime — alias ti
          else if (normSql.includes('MAX(message_time) AS ti FROM messages')) {
            res = [{ ti: '1480114098767' }]
          }
          // message.test.js: getLastMssg step 1 — alias last
          else if (normSql.includes('MAX(message_id) AS last FROM messages')) {
            res = [{ last: 1 }]
          }
          // message.test.js: getLastMssg step 2 — SELECT message, type, mssg_by
          else if (normSql.includes('SELECT message, type, mssg_by FROM messages')) {
            res = [{ message: 'hello', type: 'text', mssg_by: 24 }]
          }

          if (callback) {
            callback(null, res)
          }
          return null
        },
      }
      return connection
    },
  }
})


