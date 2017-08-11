# frozen_string_literal: true

task :default do
  Rake::Task['rubocop'].invoke
  # Rake::Task['test:system'].invoke
end
