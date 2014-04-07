require 'savon'

module TinyerpRuby
  module Poster

    class << self

      def call(connection, service, params)
        @connection = connection
        webservice = Savon.client(wsdl: @connection.base_url, convert_request_keys_to: :none)
        response = webservice.call(service, message: formatted_params(params))
        parse service, response
      end

      private
      def formatted_params(params)
        formatted = { token: @connection.api_key }
        formatted.delete(:formato)
        formatted.merge!(params)
        formatted.merge!({formato: 'json'})
        formatted
      end

      # For some reason Savon isnt parsing the response, so we do
      def parse(service, response)
        node = [service.to_s, "response"].join("_").to_sym
        body = response.body[node][:return]
        parser = Nori.new(convert_tags_to: lambda { |tag| tag.snakecase.to_sym })
        parsed = parser.parse(body)
        parsed[:retorno]
      end

    end

  end
end
