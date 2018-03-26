lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "minitest/abort_duplicate/version"

Gem::Specification.new do |spec|
  spec.name          = "minitest-abort_duplicate"
  spec.version       = Minitest::AbortDuplicate::VERSION
  spec.authors       = ["Masataka Pocke Kuwabara"]
  spec.email         = ["kuwabara@pocke.me"]

  spec.summary       = %q{Abort on duplication minitest test case.}
  spec.description   = %q{Abort on duplication minitest test case.}
  spec.homepage      = "https://github.com/pocke/minitest-abort_duplicate"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
