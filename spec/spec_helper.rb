require 'bundler/setup'
Bundler.setup

require 'webmock/rspec'
require 'savon'
require 'savon_spec'
require 'tinyerp_ruby'
require 'vcr'
require 'support/vcr'
require 'support/api_key'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.mock_with :rspec
  config.filter_run :focus

  config.order = 'random'
end

