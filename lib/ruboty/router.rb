require 'active_support'
require 'active_support/core_ext'

module Ruboty
  module Router
    # Your code goes here...
  end
end

Dir[File.expand_path('router', __dir__) << '/**/*.rb'].each { |file| require file }
Dir[File.expand_path('routers', __dir__) << '/**/*.rb'].each { |file| require file }

