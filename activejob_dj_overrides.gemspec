# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activejob_dj_overrides/version'

Gem::Specification.new do |spec|
  spec.name          = "activejob_dj_overrides"
  spec.version       = ActivejobDjOverrides::VERSION
  spec.authors       = ["Andrew Porterfield"]
  spec.email         = ["ajporterfield@gmail.com"]

  spec.summary       = 'Adds per-job overrides to the delayed_job adapter for Active Job'
  spec.description   = 'Allows max_attempts, destroy_failed_jobs?, and max_run_time methods to be defined in your jobs to override default settings just like you\'re used to in delayed_job'
  spec.homepage      = 'https://github.com/ajporterfield/activejob_dj_overrides'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
