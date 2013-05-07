# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plain_david/version'

Gem::Specification.new do |gem|
  gem.name          = "plain-david"
  gem.version       = PlainDavid::VERSION
  gem.authors       = ["Luca Spiller"]
  gem.email         = ["luca@stackednotion.com"]
  gem.description   = %q{Auto email plain text part generator}
  gem.summary       = %q{Auto email plain text part generator}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
