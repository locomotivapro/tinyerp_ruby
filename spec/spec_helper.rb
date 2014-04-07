require 'bundler/setup'
Bundler.setup

require 'support/vcr'
require 'webmock/rspec'
require 'savon'
require 'tinyerp_ruby'
require 'support/api_key'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.mock_with :rspec
  config.filter_run :focus

  config.order = 'random'
end

