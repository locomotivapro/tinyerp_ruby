require 'savon'

module TinyerpRuby
  module Poster

    class << self

      def call(connection, service, params)
        @connection = connection
        webservice = Savon.client(wsdl: @connection.base_url, convert_request_keys_to: :none, filters: [:token])
        response = webservice.call(service, message: formatted_params(params))
        parse service, response
      end

      private
      def formatted_params(params)
        params = params.first
        param_value = params.last.kind_of?(Hash) ? params.last.to_json : params.last

        formatted = { token: @connection.api_key }
        formatted.delete(:formato)
        formatted.merge!({params.first => param_value})
        formatted.merge!({formato: 'json'})
        formatted
      end

      def parse(service, response)
        node = [service.to_s, "response"].join("_").to_sym
        body = response.body[node][:return]
        parsed = JSON.parse body, symbolize_names: true
        parsed[:retorno]
      rescue
        {status: 'Erro'}
      end

    end

  end
end
