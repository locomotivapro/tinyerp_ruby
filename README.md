# TinyerpRuby
by [Locomotiva.pro](http://locomotiva.pro)


[![Build Status](https://travis-ci.org/locomotivapro/tinyerp_ruby.svg?branch=master)](https://travis-ci.org/locomotivapro/tinyerp_ruby)
[![Code Climate](https://codeclimate.com/github/locomotivapro/tinyerp_ruby.png)](https://codeclimate.com/github/locomotivapro/tinyerp_ruby)

Gem for integration with [TinyERP](http://www.tiny.com.br) API. At the moment this gem is tested under ruby 1.9.3 and have some problems with ruby 2.0 because an weird behaviour with encoding.

## Installation

Add this line to your application's Gemfile:

    gem 'tinyerp_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinyerp_ruby

## Usage

In first place you need an account in TinyERP. This gem is just a
wrapper to make calls to TinyERP api (v2) using a ruby hash and
parsing the response as a ruby hash object.

Start creating a connection with you api key, by default it will be started in production env but you can provide another env in connection initialization.

    connection = TinyerpRuby::Connection.new 'yourawesomeapikey'

Then we create a service object.

    poster = TinyerpRuby::Service.new connection

With service object created we just need to call the api methods and pass a hash according api description.

    params = {....}
    return_params = poster.pesquisar_vendedores_service(id: params)
    return_params = poster.incluir_pedido_service(pedido: params.to_json)

The list with complete api method is found [here.](http://www.tiny.com.br/manuais/api2/)

## Testing

TinyerpRuby uses VCR to mock the api requests, but if you want to test
with another api key just do the following:

At the moment TinyERP doesn`t have a test environment, so you need to
create an account (free) and generate a new key for you. With your key,
create a file named api_key.rb inside spec/support with this code:

    API_KEY = "yourawesomeeapikeyhere"

This way you are set up to run the tests

    $ rspec spec

## TODO

This is an early release and can be much improved. Next steps planned are;

  - Add builder object to complex methods as incluir_pedido and incluir_nota_fiscal
  - Add better docs for params hash object
  - Add support for better logs
  - Create rdoc
  - ...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License. Copyright 2012-2014 Locomotiva.pro. http://locomotiva.pro

You are not granted rights or licenses to the trademarks of the Locomotiva.pro.
