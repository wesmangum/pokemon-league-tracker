#!/usr/bin/env ruby

require_relative 'lib/environment'
Environment.environment = ENV["DB"] || "development"

require_relative 'lib/router'

def clean_gets
  (gets || "").chomp
end

# puts IO.readlines('pokeball.txt')

# training_paths_controller = TrainingPathsController.new()
# training_paths_controller.list
