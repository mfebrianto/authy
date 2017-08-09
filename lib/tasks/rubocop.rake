# frozen_string_literal: true

require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |task|
  task.options = %w[-R -D -S -E -c .rubocop.yml]
end
