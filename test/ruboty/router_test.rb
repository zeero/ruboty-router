require 'test_helper'

class Ruboty::RouterTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ruboty::Router::VERSION
  end
end
