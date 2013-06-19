# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
$LOAD_PATH.sort_by! { |p| p.match(%r[/rake\-]) ? 1 : 0 }
require 'rake'
require 'sunspot/rails/tasks'

TwitterEnvy::Application.load_tasks
