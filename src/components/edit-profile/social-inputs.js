import React, { Component } from 'react'
import PropTypes from 'prop-types'
import TextInput from '../others/input/text'
import { fieldsToArray } from '../../utils/edit-profile-utils'

// Maps DB field names to user-friendly display labels
const FIELD_LABELS = {
  instagram: 'LinkedIn',
  twitter: 'X (Twitter)',
  facebook: 'Facebook',
  github: 'GitHub',
  website: 'Website',
  phone: 'Phone',
}

export default class SocialInputs extends Component {
  map = ({ key, value }) => (
    <TextInput
      placeholder={FIELD_LABELS[key] || key}
      value={value}
      valueChange={e => this.props.change(key, e)}
      maxLength={key == 'phone' ? '10' : '255'}
    />
  )

  render() {
    // For disabled key warning
    console.error = () => {}

    let { inputs } = this.props
    let array = fieldsToArray(inputs)
    let mappedInputs = array.map(this.map)

    return (
      <div className="edit_sm_div">
        <span className="edit_span">Professional Links</span>
        {mappedInputs}
      </div>
    )
  }
}

SocialInputs.propTypes = {
  inputs: PropTypes.shape({
    instagram: PropTypes.string.isRequired,
    github: PropTypes.string.isRequired,
    twitter: PropTypes.string.isRequired,
    facebook: PropTypes.string.isRequired,
    website: PropTypes.string.isRequired,
    phone: PropTypes.string.isRequired,
  }).isRequired,
  change: PropTypes.func.isRequired,
}
