#!/usr/bin/env ruby
require 'rubygems'
require 'fire_hydrant'
require 'yaml'

hydrant = FireHydrant.new(YAML.load(File.read("fire_hydrant.yml")))

hydrant.on_location_update do |user|
  puts "#{user.token} has moved to #{user.locations.first}."
end

hydrant.run!
