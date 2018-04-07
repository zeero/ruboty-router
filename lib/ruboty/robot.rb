module Ruboty
  class Robot
    alias original_handle handle

    def handle
      original_handle
      server = WEBrick::HTTPServer.new(
        DocumentRoot: '.',
        BindAddress: '127.0.0.1',
        Port: ENV['RUBOTY_ROUTER_PORT'] || 8888,
        ServerType: Thread
      )
      Ruboty::Router.routers.each { |router| router.new(self).call(server) }
      trap('INT') { server.shutdown }
      server.start
      server
    end
  end
end
