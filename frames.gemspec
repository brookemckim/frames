# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'frames/version'

Gem::Specification.new do |gem|
  gem.name          = "frames"
  gem.version       = Frames::VERSION
  gem.authors       = ["brookemckim"]
  gem.email         = ["brooke.mckim@gmail.com"]
  gem.description   = %q{Uses ffprobe to retrieve metadata about each frame of a video.}
  gem.summary       = %q{Analyze video metadata frame by frame.}
  gem.homepage      = "http://github.com/brookemckim/frames"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'mocha'
end

