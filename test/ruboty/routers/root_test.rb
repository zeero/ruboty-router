require 'test_helper'

describe Ruboty::Routers::Root do
  include Rack::Test::Methods

  let(:robot) { mock.tap { |mock| mock.expects(:say).never } }

  before do
  end

  def app
    Ruboty::Router::Server.app(robot)
  end

  describe 'root' do
    it 'should return 200' do
      get '/'
      last_response.must_be :ok?
      last_response.body.must_equal 'Ruboty::Router works!'
    end
  end
end

