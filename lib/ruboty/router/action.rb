module Ruboty
  module Router
    class Action
      attr_reader :options, :path

      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def call(router, server, _options = {})
        server.mount_proc path do |req, res|
          router.send(name, req, res)
        end
      end

      def name
        options[:name]
      end
    end
  end
end
