import { randNum } from '../../../utils/utils'
import f from './f'

export default {
  usersToRecommend: [
    {
      follow_id: randNum(),
      follow_to: 102,
      username: 'macro_trader',
      firstname: 'Priya',
      surname: 'Nair',
    },
    {
      follow_id: randNum(),
      follow_to: 106,
      username: 'market_edge',
      firstname: 'Aisha',
      surname: 'Khan',
    },
  ],
  followers: f,
  followings: f,
  favourites: [
    {
      fav_id: 3,
      fav_by: 101,
      user: 104,
      username: 'value_hunter',
      firstname: 'Sneha',
      surname: 'Kapoor',
      fav_time: '1680500000000',
    },
  ],
  recommendations: [
    {
      recommend_id: 3,
      recommend_of: 108,
      recommend_of_username: 'ai_invest',
      recommend_of_firstname: 'Diya',
      recommend_of_surname: 'Pillai',
      recommend_to: 101,
      recommend_by: 105,
      recommend_time: '1680500100000',
      recommend_by_username: 'fintech_founder',
    },
  ],
  profile_views: 10,
  isFollowing: false,
}
