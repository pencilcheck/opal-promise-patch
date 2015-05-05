# -*- encoding: utf-8 -*-
require File.expand_path('../lib/opals/promise_patch/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "opal-promise-patch"
  s.version     = Promise::VERSION
  s.authors     = ["Penn Su"]
  s.email       = ["pennsu@gmail.com"]
  s.homepage    = "https://github.com/pencilcheck/opal-promise-patch"
  s.summary     = "A new way to write synchronize code with opal promises"
  s.description = ""
  s.license     = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir["test/**/*"]
  s.require_paths = ['lib']

  s.add_runtime_dependency 'opal', '>= 0.7.0', '< 0.9.0'
end
