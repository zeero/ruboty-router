require 'active_support'
require 'active_support/core_ext'
require 'i18n'
require 'mem'
require 'rack'
require 'webrick'

module Ruboty
  module Router
    RUBOTY_ROUTER_PORT = ENV['RUBOTY_ROUTER_PORT'] || 9292

    class << self
      include Mem

      def routers
        []
      end
      memoize :routers
    end
  end
end

require_relative 'robot.patch'
Dir[File.expand_path('router', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('routers', __dir__) << '/**/*.rb'].each { |file| require file }

I18n.load_path << Dir[File.expand_path('router/locale/*.yml', __dir__)]

