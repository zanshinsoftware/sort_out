require_relative 'lib/sort_out/version'

Gem::Specification.new do |spec|
  spec.name          = "sort_out"
  spec.version       = SortOut::VERSION
  spec.authors       = ["Felipe Diesel"]
  spec.email         = ["felipediesel@gmail.com"]

  spec.summary       = %q{ActiveRecord extension that makes easy to order fields.}
  spec.description   = %q{ActiveRecord extension that makes easy to order fields.}
  spec.homepage      = "http://github.com/felipediesel/sort_out"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://github.com/felipediesel/sort_out"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
end
