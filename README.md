[![Build Status](https://travis-ci.org/zeero/ruboty-router.svg?branch=master)](https://travis-ci.org/zeero/ruboty-router)
[![Gem Version](https://badge.fury.io/rb/ruboty-router.svg)](https://badge.fury.io/rb/ruboty-router)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.txt)

# Ruboty::Router

A Ruboty Handler + Actions to enable routing function to Ruboty.

[Ruboty](https://github.com/r7kamura/ruboty) is Chat bot framework. Ruby + Bot = Ruboty

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-router'
```

And then execute:

    $ bundle

## Usage

WEBrick will start with port 9292 by default, when starting Ruboty.

You can define routings by Ruboty::Routers class.
Sample is below:

```ruby
module Ruboty
  module Routers
    class Sample < Base
      route('/sample', name: 'sample', description: 'sample router.')
      route('/sample/child', name: 'child', description: 'sample router.')

      def sample(req, res)
        res.write 'This is sample.'
        robot.say(body: 'something to say', to: '#general')
      end

      def child(req, res)
        res.write 'This is sample for multiple definition.'
        robot.say(body: 'something to say for /sample/child', to: '#general')
      end
    end
  end
end
```

* `route(<path>, name: <method_name>, description: <description>)`
  * Add routing
  * `<path>` **must start with '/'**
* `def sample(req, res)`
  * Routing method definition
  * Method receive [Rack::Request](http://www.rubydoc.info/gems/rack/Rack/Request) and [Rack::Response](http://www.rubydoc.info/gems/rack/Rack/Response)

## ENV

|Name|Description|
|:--|:--|
|RUBOTY_ROUTER_PORT|HTTP listen port (default: 9292)|

## Contributing

1. Fork it ( https://github.com/zeero/ruboty-router/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

