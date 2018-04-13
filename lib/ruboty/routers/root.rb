module Ruboty
  module Routers
    class Root < Base
      route('/', name: 'root', description: 'Routing for /')

      def root(req, res)
        # server response
        res.body = 'Ruboty::Router works!'

        # example for reaction in chat
        # robot.say(body: 'something to say', to: '#general')
      end
    end
  end
end
