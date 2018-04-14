module Ruboty
  module Routers
    class Base
      class << self
        include Mem

        def inherited(child)
          Ruboty::Router.routers << child
        end

        def route(path, options = {})
          actions << Router::Action.new(path, options)
        end

        def actions
          []
        end
        memoize :actions
      end

      include Env::Validatable

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate!
      end

      def call(options = {})
        self.class.actions.inject({}) do |routes, action|
          routes.merge!(action.call(self, options))
        end
      end
    end
  end
end
