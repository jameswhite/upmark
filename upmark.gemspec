# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "upmark"
  s.version     = "0.10.0"
  s.authors     = ["Josh Bassett", "Gus Gollings", "James Healy"]
  s.email       = "dev@theconversation.edu.au"
  s.homepage    = "http://github.com/conversation/upmark"
  s.summary     = %q{A HTML to Markdown converter.}
  s.description = %q{Upmark has the skills to convert your HTML to Markdown.}

  s.required_ruby_version = ">= 1.9.3"
  s.rubyforge_project = "upmark"

  s.files       =  Dir.glob("{lib,spec}/**/*") + ["Rakefile", "LICENSE.md", "README.md"]
  s.test_files  =  Dir.glob("{spec}/**/*")
  s.executables = ["upmark"]

  s.add_development_dependency "rspec", "~> 3.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "simplecov"

  s.add_runtime_dependency "parslet", "~> 1.7.0"
end
