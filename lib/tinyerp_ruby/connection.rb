module TinyerpRuby
  class Connection
    attr_reader :base_url, :environment, :api_key

    def initialize(api_key, environment = :production)
      @environment = eval(environment.to_s.capitalize)
      @base_url = @environment::BASE_URL
      @api_key = api_key
    end
  end
end
