import React, { Fragment } from 'react'
import { bool } from 'prop-types'
import AppLink from '../others/link/link'

const GroupInstruction = ({ showBtns }) => (
  <div className="sabout_one">
    <img src="/images/tree.png" />
    <div className="sabout_one_info">
      <span>Complete your Investment Club profile to attract like-minded investors</span>
      {showBtns && (
        <Fragment>
          <AppLink url="/" className="sec_btn" label="Update Club" />
          <AppLink url="/edit-profile" className="pri_btn" label="Edit Club" />
        </Fragment>
      )}
    </div>
  </div>
)

GroupInstruction.defaultProps = {
  showBtns: true,
}

GroupInstruction.propTypes = {
  showBtns: bool,
}

export default GroupInstruction
