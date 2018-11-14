# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mf_cloud/invoice/version'

Gem::Specification.new do |spec|
  spec.name          = "mf_cloud-invoice"
  spec.version       = MfCloud::Invoice::VERSION
  spec.authors       = ["Izumiya Keisuke"]
  spec.email         = ["izumiya.keisuke@moneyforward.co.jp"]

  spec.summary       = %q{MFCloud Invoice API wrapper}
  spec.description   = %q{Let's start cloud invoice!}
  spec.homepage      = "https://github.com/moneyforward/mf_cloud-invoice-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">=0.9"
  spec.add_dependency "faraday_middleware", ">=0.9"
  spec.add_dependency 'activesupport', '~> 5.0'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'rspec-parameterized'
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
