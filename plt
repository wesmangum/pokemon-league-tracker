#!/usr/bin/env ruby

require_relative 'lib/environment'
Environment.environment = ENV["DB"] || "development"

require_relative 'lib/router'

def clean_gets
  (gets || "").chomp
end

puts IO.readlines('pokemon.txt')

Router.main_menu
