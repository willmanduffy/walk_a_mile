# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

WalkAMile::Application.load_tasks

Rake::TestTask.new do |t|
  t.pattern = 'test/models/*.rb'
  t.pattern = 'text/controllers/*.rb'
end

task :default => [:test]
