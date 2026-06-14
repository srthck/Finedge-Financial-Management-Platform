// MYSQL DATABASE CONNECTION WITH AUTO-RECONNECT

const mysql = require('mysql2'),
  { error, success } = require('handy-log'),
  { MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE } = process.env

let db

/**
 * Creates a new MySQL connection and handles reconnection on disconnect.
 */
const connect = () => {
  db = mysql.createConnection({
    host: MYSQL_HOST,
    user: MYSQL_USER,
    password: MYSQL_PASSWORD,
    database: MYSQL_DATABASE,
    charset: 'utf8mb4',
  })

  db.connect(err => {
    if (err) {
      error(`MySQL connection failed: ${err.message}`)
      error('Retrying in 5 seconds...')
      setTimeout(connect, 5000)
    } else {
      success('MySQL connected.')
    }
  })

  db.on('error', err => {
    error(`MySQL error: ${err.message}`)
    if (err.code === 'PROTOCOL_CONNECTION_LOST' || err.fatal) {
      error('MySQL connection lost. Reconnecting...')
      connect()
    } else {
      throw err
    }
  })
}

connect()

// Proxy so all requires of this module get the live connection
module.exports = new Proxy({}, {
  get: (_, prop) => {
    if (typeof db[prop] === 'function') {
      return db[prop].bind(db)
    }
    return db[prop]
  }
})
