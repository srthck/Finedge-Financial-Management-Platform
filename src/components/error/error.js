import React from 'react'
import { FadeIn } from 'animate-components'
import Title from '../others/title'
import { c_first } from '../../utils/utils'
import { connect } from 'react-redux'
import AppLink from '../others/link/link'

const Error = ({ match, username }) => {
  let { params } = match
  let what = params.what ? params.what : 'page'

  let title = c_first(`${what}`)

  return (
    <div className="error">
      <Title value={`Oops!! ${title} not found`} />

      <FadeIn duration="300ms">
        <div className="error_div">
          <div className="error_info">
            <span style={{ color: '#00E676', fontSize: 48, fontWeight: 800, letterSpacing: 3, display: 'block' }}>404</span>
            <span style={{ color: '#94A3B8' }}>The {what} you're looking for doesn't exist on FinEdge.</span>
          </div>

          <img src="/images/error.svg" />

          <div className="error_bottom">
            <AppLink
              to={`/profile/${username}`}
              label="My Profile"
              className="sec_btn error_home"
            />
            <AppLink
              to="/"
              label="Go to Insight Feed"
              className="pri_btn error_login"
            />
          </div>
        </div>
      </FadeIn>
    </div>
  )
}

const mapStateToProps = state => ({
  username: state.User.session.username,
})

export default connect(mapStateToProps)(Error)
