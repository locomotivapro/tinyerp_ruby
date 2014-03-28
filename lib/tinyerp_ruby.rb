require "tinyerp_ruby/version"
require "tinyerp_ruby/connection"
require "tinyerp_ruby/service"
require "tinyerp_ruby/poster"

module TinyerpRuby
  class Production
    BASE_URL = "http://www.tiny.com.br/api2.php?wsdl"
  end

  class Test
    BASE_URL = "http://test.com"
  end
end
