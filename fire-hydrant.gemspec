Gem::Specification.new do |s|
  s.name = "fire-hydrant"
  s.version = "0.0.2"
  s.summary = "Fire Eagle XMPP PubSub tools"
  s.description = "Tools for consuming Fire Eagle's XMPP PubSub feed."
  s.authors = ["Seth Fitzsimmons"]
  s.email = ["seth@mojodna.net"]

  s.files = ["examples", "examples/authorize.rb", "examples/fire_eagle_consumer.rb", "examples/fire_eagle_visualizer.rb", "fire-hydrant.gemspec", "fire_hydrant.yml", "fire_hydrant.yml.development", "fire_hydrant.yml.production", "fire_hydrant.yml.sample", "lib", "lib/fire_hydrant", "lib/fire_hydrant/fire_hydrant.rb", "lib/fire_hydrant/jacks", "lib/fire_hydrant/jacks/fire_eagle_jack.rb", "lib/fire_hydrant/jacks.rb", "lib/fire_hydrant.rb", "README.markdown"]
  s.require_paths = ["lib"]

  s.add_dependency("fireeagle")
  s.add_dependency("mojodna-switchboard")
end
