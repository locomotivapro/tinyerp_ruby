# TinyerpRuby

Gem for integration with TinyERP API

## Installation

Add this line to your application's Gemfile:

    gem 'tinyerp_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinyerp_ruby

## Usage

In first place you need an account in TinyERP. This gem iis just a
wrapper to make calls to TinyERP api (v2) using a ruby hash and
parsing the response as a ruby hash object.

    # Start creating a connection with you api key
    # by default it will be started in production env but you can
    # provide another env in connection initialization
    connection = tinyerpRuby::Connection.new 'yourawesomeapikey'

    # Then we create a service object
    poster = TinyerpRuby::Service.new connection

    # With service object created we just need to call the api methods
    # and pass a hash according api description
    params = {....}
    return_params = poster.pesquisar_vendedores_service(params)

## Testing

TinyerpRuby uses VCR to mock the api requests, but if you want to test
with another api key just do the following:

At the moment TinyERP doesn`t have a test environment, so you need to
create an account (free) and generate a new key for you. With your key,
create a file named api_key.rb inside spec/support with this code:

    API_KEY = "yourawesomeeapikeyhere"

This way you are set up to run the tests

    $ rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
