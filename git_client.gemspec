  # coding: utf-8
  lib = File.expand_path('../lib', __FILE__)
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
  require 'git_client/version'
  Gem::Specification.new do |spec|
    spec.name          = "git_client"
    spec.version       = GitClient::VERSION
    spec.authors       = ["Raissa Ferreira"]
    spec.email         = ["rai200890@gmail.com"]
    spec.summary       = "GitClient"
    spec.description   = "Gem for consuming git provider's API"
    spec.homepage      = ""
    spec.license       = "MIT"
    spec.files         = `git ls-files -z`.split("\x0")
    spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ["lib"]
    spec.add_runtime_dependency "rest-client"
    spec.add_development_dependency "byebug"
    spec.add_development_dependency "bundler", "~> 1.7"
    spec.add_development_dependency "rake", "~> 10.0"
  end
