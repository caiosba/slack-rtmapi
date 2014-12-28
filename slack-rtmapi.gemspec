
require_relative "slack-rtmapi/version"

Gem::Specification.new do |s|
  s.name = 'slac-rtmapi'
  s.version = SlackRTM::VERSION
  s.authors = ["mackwic"]
  s.email = ["mackwic@gmail.com"]
  s.summary = "Naive wrapper for the Slack RTM api"
  s.description = "slack-rtmapi is dumb: no EventMachine, no Celluloid, no Actor
design pattern, no thread pool (thought, any of those would be trivial to add).
It's a simple blocking loop on top of a SSL socket with a websocket decoder.
Minimal dependency. Works out of the box. Hackable. Composable.
  
Oh, by the way, it implements very well the Slack API."
  s.homepage = "https://github.com/mackwic/slack-rtmapi"
  s.licence = "GPLv3"

  s.files = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|s|features)/})
  s.require_paths = ["lib"]
  
  dev_dep = %w(
    colored
  )

  run_dep = %w(
    websocket-driver
  )

  dev_dep.each {|d| s.add_development_dependency d}
  run_dep.each {|d| s.add_runtime_dependency d}
end