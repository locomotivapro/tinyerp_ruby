require 'savon'

module TinyerpRuby
  module Poster

    class << self

      def call(connection, service, params)
        formatted_params = { token: connection.api_key, format: 'xml' }
        formatted_params.merge!(params)

        webservice = Savon.client(wsdl: connection.base_url, log: false)
        response = webservice.call(service, message: formatted_params)
        parse service, response
      end

      private

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
