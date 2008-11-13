require 'rubygems'
begin
  require 'fireeagle'
  require 'switchboard'
rescue LoadError => e
  gem = e.message.split("--").last.strip
  puts "The #{gem} gem is required."
end

class FireHydrant < Switchboard::Core
  DEFAULTS = {
    "resource" => "fire_hydrant"
  }

  def initialize(settings = {})
    super(DEFAULTS.merge(settings), true)
    plug!(FireEagleJack)
  end
end
