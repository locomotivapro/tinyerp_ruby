require 'bundler/setup'
Bundler.setup

Dir[File.dirname(__FILE__) + "/support/*.rb"].each { |f| p f; require f }

require 'webmock/rspec'
require 'savon'
require 'tinyerp_ruby'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.mock_with :rspec
  config.filter_run :focus

  config.order = 'random'
end

