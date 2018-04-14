module Ruboty
  module Router
    class Server
      class << self
        def app(robot)
          routes = Ruboty::Router.routers.inject({}) { |result, router| result.merge!(router.new(robot).call) }
          Rack::URLMap.new(routes)
        end

        def start(robot)
          Thread.new do
            Rack::Server.start(
              app: app(robot),
              Port: Ruboty::Router::RUBOTY_ROUTER_PORT,
            )
          end
        end
      end
    end
  end
end

