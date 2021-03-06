#!/usr/bin/env ruby
require 'rubygems'
begin
  require 'appscript'
rescue LoadError => e
  gem = e.message.split("--").last.strip
  puts "The #{gem} gem is required."
end

require 'fire_hydrant'

earth = Appscript.app("Google Earth")

# override the resource as "visualizer"
hydrant = FireHydrant.new(YAML.load(File.read("fire_hydrant.yml")).merge("resource" => "visualizer"))

hydrant.on_location_update do |user|
  puts "#{user.token} has moved to #{user.locations.first}."

  geom = user.locations[0].geom
  begin
    pt = geom.is_a?(GeoRuby::SimpleFeatures::Envelope) ? geom.center : geom
    earth.SetViewInfo({:latitude => pt.y, :longitude => pt.x, :distance => (rand * 25000) + 5000, :azimuth => rand * 360, :tilt => (rand * 75)}, {:speed => 1})
  rescue # rescue from Appscript errors
  end
end

hydrant.run!
