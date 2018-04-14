module Ruboty
  module Router
    class Server
      def self.start(robot)
        routes = Ruboty::Router.routers.inject({}) { |result, router| result.merge!(router.new(robot).call) }
        Thread.new do
          Rack::Server.start(
            app: Rack::URLMap.new(routes),
            Port: Ruboty::Router::RUBOTY_ROUTER_PORT,
          )
        end
      end
    end
  end
end

