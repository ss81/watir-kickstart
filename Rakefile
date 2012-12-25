require 'rubygems'
require "rspec/core/rake_task"

task :default => :TASK

RSpec::Core::RakeTask.new(:TASK) do |spec|
  spec.pattern = 'TASK_spec.rb'
  spec.rspec_opts = ['--format RspecJunitFormatter --out reports/TASK.xml']
end