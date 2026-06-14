import React, { Component } from 'react'
import { connect } from 'react-redux'
import { getTrendingPosts } from '../../../actions/explore'
import AppLink from '../link/link'
import { shortener } from '../../../utils/utils'
import IsLoading from '../isLoading'
import { cLoading } from '../../../utils/utils'

class TrendingPosts extends Component {
  state = {
    loading: true,
  }

  componentDidMount = () => {
    this.props.dispatch(getTrendingPosts())
  }

  componentWillReceiveProps = () => this.setState({ loading: false })

  render() {
    let { trendingPosts } = this.props
    let { loading } = this.state
    let len = trendingPosts.length

    return (
      <div className="recomm trending_insights_widget">
        <div className="recomm_top">
          <span>Trending Insights</span>
        </div>

        <div
          className="recomm_main"
          style={{ height: loading ? 80 : 'inherit' }}
        >
          <IsLoading loading={loading} />

          <div className={cLoading(loading)}>
            {len === 0 ? (
              <p className="trending_empty">No trending insights yet.</p>
            ) : (
              trendingPosts.map((post, i) => (
                <AppLink
                  key={post.post_id}
                  url={`/post/${post.post_id}`}
                  className="trending_item"
                >
                  <div className="trending_rank">#{i + 1}</div>
                  <div className="trending_content">
                    <span className="trending_username">@{post.username}</span>
                    <p className="trending_desc">
                      {shortener(post.description || 'Market insight', 72)}
                    </p>
                    <span className="trending_stats">
                      ▲ {post.likes_count} &nbsp;· &nbsp;
                      💬 {post.comments_count}
                    </span>
                  </div>
                </AppLink>
              ))
            )}
          </div>
        </div>
      </div>
    )
  }
}

const mapStateToProps = store => ({
  trendingPosts: store.Explore.trendingPosts,
})

export default connect(mapStateToProps)(TrendingPosts)
