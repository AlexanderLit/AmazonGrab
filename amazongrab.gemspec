# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "amazongrab/version"

Gem::Specification.new do |s|
  s.name        = "AmazonGrab"
  s.version     = AmazonGrab::VERSION
  s.authors     = ["Alex"]
  s.email       = ["saslitvinenko@yandex.ru"]
  s.homepage    = ""
  s.summary     = "Hey!"
  s.description = "A bundle-using gem"

  s.rubyforge_project = "AmazonGrab"

  s.files         = ["lib/amazongrab.rb", "lib/amazongrab/version.rb", ".gitignore", "Gemfile", "Rakefile", "amazongrab.gemspec"]
  s.executables   = ["amazongrab"]
  s.test_files  = Dir.glob("{spec,test}/**/*.rb")

  # specify any dependencies here; for example:
  s.add_runtime_dependency "nokogiri"
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  # s.add_runtime_dependency "rest-client"
end