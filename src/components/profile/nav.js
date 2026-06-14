import React from 'react'
import ProfileNavLink from '../others/profile-navlink'
import PropTypes from 'prop-types'
import { Me } from '../../utils/utils'
import classNames from 'classnames'

const ProfileNav = ({ url, user }) => {
  return (
    <div
      className={classNames('pro_nav', 'user_nav', { not_me_nav: !Me(user) })}
    >
      <ul>
        <ProfileNavLink url={url} label="Insights" />
        <ProfileNavLink url={`${url}/tagged`} label="Tagged" />
        <ProfileNavLink url={`${url}/shared`} label="Shared" />
        <ProfileNavLink url={`${url}/gallery`} label="Portfolio" />
        {Me(user) && (
          <ProfileNavLink url={`${url}/bookmarks`} label="Watchlist" />
        )}
        <ProfileNavLink url={`${url}/groups`} label="Investment Clubs" />
        <ProfileNavLink url={`${url}/about`} label="About" />
      </ul>
    </div>
  )
}

ProfileNav.propTypes = {
  url: PropTypes.string.isRequired,
  user: PropTypes.number,
}

export default ProfileNav
