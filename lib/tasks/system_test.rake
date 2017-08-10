# frozen_string_literal: true

namespace :test do
  task :system do
    sh 'bundle exec rspec --tag system_test'
  end
end
