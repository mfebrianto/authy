# frozen_string_literal: true
require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation

  config.before(:suite) do
    DatabaseCleaner.clean
    Rails.application.load_seed
  end
end