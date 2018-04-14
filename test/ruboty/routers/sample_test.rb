require 'test_helper'

describe Ruboty::Routers::Sample do
  include Rack::Test::Methods

  let(:robot) { Ruboty::Robot.new }

  before do
  end

  def app
    Ruboty::Router::Server.app(robot)
  end

  describe 'sample' do
    it 'should return 200' do
      get '/sample'
      last_response.must_be :ok?
      last_response.body.must_equal 'Sample!'
    end

    it 'should chat' do
      Ruboty::Adapters::Shell.any_instance.expects(:say).with(body: 'something to say').once
      get '/sample'
    end
  end

  describe 'child' do
    it 'should return 200' do
      get '/sample/child'
      last_response.must_be :ok?
      last_response.body.must_equal 'Child!'
    end

    it 'should chat' do
      Ruboty::Adapters::Shell.any_instance.expects(:say).with(body: 'something to say for child').once
      get '/sample/child'
    end
  end
end

