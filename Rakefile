require 'rubygems'
require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new(:core) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['--backtrace --color']
end

desc "To run battleship_game.rb file"
task :run_me do
  ruby "battle_ship_game.rb"
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -I. -rbattle_ship_game.rb"
end
