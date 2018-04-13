module Ruboty
  class Robot
    alias original_adapt adapt

    private

    def adapt
      routing
      original_adapt
    end

    def routing
      server = WEBrick::HTTPServer.new(
        DocumentRoot: '.',
        BindAddress: '127.0.0.1',
        Port: ENV['RUBOTY_ROUTER_PORT'] || 8888,
        ServerType: Thread
      )
      Ruboty::Router.routers.each { |router| router.new(self).call(server) }
      trap('INT') { server.shutdown }
      server.start
    end
  end
end

