#!/usr/bin/env ruby
require 'fire_hydrant'
require 'yaml'

hydrant = FireHydrant.new(YAML.load(File.read("fire_hydrant.yml")))

hydrant.on_location_update do |user|
  # for some reason the Fire Eagle gem doesn't work when I access #name directly
  name = user.locations[0].instance_eval { @doc.at("//name").innerText }
  puts "#{user.token} has moved to #{name}."
end

hydrant.run!
