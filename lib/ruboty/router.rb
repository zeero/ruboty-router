require 'active_support'
require 'active_support/core_ext'
require 'mem'
require 'webrick'

module Ruboty
  module Router
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

