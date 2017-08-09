# frozen_string_literal: true

task :default do
  Rake::Task['rubocop'].invoke
end
