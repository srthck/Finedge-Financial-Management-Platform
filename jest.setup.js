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

