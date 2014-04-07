require 'vcr'
API_KEY = 'awesomeapikey' unless defined?(API_KEY)

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path('../vcr',__FILE__)
  c.hook_into :webmock
  c.filter_sensitive_data('<APIKEY>') { API_KEY }
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end
