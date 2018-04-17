require 'test_helper'

describe Ruboty::Routers::Sample do
  include Rack::Test::Methods

  let(:robot) { Ruboty::Robot.new }

  before do
    $stdout = StringIO.new
  end

  after do
    $stdout = STDOUT
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

    it 'should be able to chat' do
      Ruboty::Adapters::Shell.any_instance.expects(:say).with(body: 'something to say').once
      get '/sample'
    end
  end

  describe 'child' do
    it 'should be able to define multiple route' do
      Ruboty::Adapters::Shell.any_instance.expects(:say).with(body: 'something to say for child').once
      get '/sample/child'
      last_response.must_be :ok?
      last_response.body.must_equal 'Child!'
    end
  end

  describe 'failed' do
    it 'should display warning message' do
      get 'failed'
      last_response.body.wont_equal 'Failed!'
      output = $stdout.string
      output.must_equal I18n.t('warnings.invalid_route', path: 'failed') + "\n"
    end
  end
end

