begin
  require 'fireeagle'
  require 'switchboard'
rescue LoadError => e
  lib = e.message.split("--").last.strip
  puts "#{lib} is required."
end

class FireHydrant < Switchboard::Client
  DEFAULTS = {
    "resource" => "fire_hydrant"
  }

  def initialize(settings = {})
    super(DEFAULTS.merge(settings), true)
    plug!(FireEagleJack)
  end
end
