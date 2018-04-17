module Ruboty
  module Router
    class Action
      attr_reader :options, :path

      def initialize(path, options = {})
        @path = path
        @options = options
      end

      def call(router, _options = {})
        unless path.start_with? '/'
          puts I18n.t('warnings.invalid_route', path: path)
          return {}
        end
        proc = lambda do |env|
          req = Rack::Request.new(env)
          res = Rack::Response.new
          router.send(name, req, res)
          res.to_a
        end
        { path => proc }
      end

      def name
        options[:name]
      end
    end
  end
end
