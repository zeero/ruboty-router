require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'
require 'rack/test'

require 'ruboty'

require 'ruboty/router'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

module Ruboty
  module Routers
    class Sample < Base
      route('/sample', name: 'sample', description: 'sample router for unit test.')
      route('/sample/child', name: 'child', description: 'sample router for unit test.')

      def sample(_req, res)
        res.write 'Sample!'
        robot.say(body: 'something to say')
      end

      def child(_req, res)
        res.write 'Child!'
        robot.say(body: 'something to say for child')
      end
    end
  end
end

