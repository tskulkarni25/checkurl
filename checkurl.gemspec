
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "checkurl/version"

Gem::Specification.new do |spec|
  spec.name          = "checkurl"
  spec.version       = Checkurl::VERSION
  spec.authors       = ["Tushar"]
  spec.email         = ["tskulkarni25@gmail.com"]

  spec.summary       = %q{A gem for checking details related to any given url.}
  spec.description   = %q{A gem for checking details related to any given url. For example get response code, check if url is working or not, etc.}
  spec.homepage      = "https://github.com/tskulkarni25/checkurl"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
