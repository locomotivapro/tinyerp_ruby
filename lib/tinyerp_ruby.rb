require "tinyerp_ruby/version"
require "tinyerp_ruby/connection"


module TinyerpRuby
  class Production
    BASE_URL = "http://www.tiny.com.br/api2"
  end

  class Test
    BASE_URL = "http://test.com"
  end
end
