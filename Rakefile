require "rubygems"
require "rspec/core/rake_task"

task :default => :all

RSpec::Core::RakeTask.new(:all) do |spec|
  spec.pattern = "*_spec.rb"
  spec.rspec_opts = ["--format RspecJunitFormatter --out reports/all.xml"]
end

RSpec::Core::RakeTask.new(:TASK) do |spec|
  spec.pattern = "TASK_spec.rb"
  spec.rspec_opts = ["--format RspecJunitFormatter --out reports/TASK/report.xml"]
end

#RSpec::Core::RakeTask.new(:registration) do |spec|
#  spec.pattern = "registration_spec.rb"
#  spec.rspec_opts = ["--format RspecJunitFormatter --out reports/registration/report.xml"]
#end
