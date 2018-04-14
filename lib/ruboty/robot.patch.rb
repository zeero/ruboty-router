module Ruboty
  class Robot
    alias original_adapt adapt

    private

    def adapt
      server
      original_adapt
    end

    def server
      Ruboty::Router::Server.start(self)
    end
  end
end

