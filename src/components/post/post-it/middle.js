import React from 'react'
import { connect } from 'react-redux'
import FileInput from '../../others/input/file'
import TextArea from '../../others/input/textArea'
import { CPP } from '../../../actions/post'

// Sentiment options config — centralised for easy reference
const SENTIMENTS = [
  { value: 'bullish', label: '▲ Bullish' },
  { value: 'neutral', label: '● Neutral' },
  { value: 'bearish', label: '▼ Bearish' },
]

const PostItMiddle = ({ postIt, session, dispatch }) => {
  let { username } = session
  let { fileChanged, desc, previewImg, filter, fileInput, sentiment } = postIt

  let dp = (...args) => dispatch(CPP(...args))

  let fileChange = e => {
    e.preventDefault()
    dp('fileChanged', true)
    dp('fileInput', e.target.value)

    let reader = new FileReader(),
      file = e.target.files[0]
    dp('targetFile', file)

    reader.onload = e => dp('previewImg', e.target.result)
    reader.readAsDataURL(file)
  }

  let valueChange = e => dp('desc', e.target.value)

  let pickSentiment = value => {
    // Toggle off if same button clicked again
    dp('sentiment', sentiment === value ? null : value)
  }

  return (
    <div className="i_p_main p_main" style={{ height: fileChanged ? 336 : 296 }}>
      {fileChanged ? (
        <div>
          <div className="i_p_ta">
            <TextArea
              placeholder={`What's your market insight today, @${username}?`}
              value={desc}
              valueChange={valueChange}
              className="t_p_ta"
            />
          </div>

          {/* Sentiment picker — only visible after image is chosen */}
          <div className="sentiment_picker">
            {SENTIMENTS.map(s => (
              <button
                key={s.value}
                type="button"
                className={`sentiment_btn s_${s.value}${sentiment === s.value ? ' s_active' : ''}`}
                onClick={() => pickSentiment(s.value)}
              >
                {s.label}
              </button>
            ))}
          </div>

          <div className="i_p_img">
            <img src={previewImg} className={filter} />
          </div>
        </div>
      ) : (
        <form
          className="post_img_form"
          method="post"
          encType="multipart/formdata"
        >
          <FileInput
            value={fileInput}
            fileChange={fileChange}
            label="Choose an image"
            labelClass="pri_btn"
          />
        </form>
      )}
    </div>
  )
}

const mapStateToProps = state => ({
  session: state.User.session,
  postIt: state.Post.postIt,
})

export default connect(mapStateToProps)(PostItMiddle)
export { PostItMiddle as PurePostItMiddle }
