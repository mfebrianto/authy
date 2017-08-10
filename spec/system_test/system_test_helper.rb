# frozen_string_literal: true

require 'database_cleaner'

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation

  config.before(:each, :system_test) do
    DatabaseCleaner.clean
  end
end
