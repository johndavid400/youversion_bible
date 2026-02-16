require_relative "lib/youversion_bible/version"

Gem::Specification.new do |spec|
  spec.name          = "youversion_bible"
  spec.version       = YouversionBible::VERSION
  spec.authors       = ["JD Warren"]
  spec.email         = ["johndavid400@gmail.com"]

  spec.summary       = "Ruby wrapper for the YouVersion Bible API"
  spec.description   = "A Ruby gem wrapper around the YouVersion Bible API. Includes: Bibles, Highlights, Languages, Licenses, Organizations, and Verse of the Day endpoints."
  spec.homepage      = "https://github.com/johndavid400/youversion_bible"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0"

  # Files included in the gem
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0")
  end

  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "excon", "~> 0.109"
  spec.add_dependency "json", ">= 2.0"

  # Dev dependencies
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "standard", "~> 1.35"
  spec.add_development_dependency "pry", "~> 0.14"
end
