# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acts_as_votable"
  s.version = "0.10.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan"]
  s.date = "2014-06-08"
  s.description = "Rails gem to allowing records to be votable"
  s.email = ["ryanto"]
  s.homepage = "http://rubygems.org/gems/acts_as_votable"
  s.require_paths = ["lib"]
  s.rubyforge_project = "acts_as_votable"
  s.rubygems_version = "2.0.14"
  s.summary = "Rails gem to allowing records to be votable"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, ["= 1.3.7"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<sqlite3>, ["= 1.3.7"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<sqlite3>, ["= 1.3.7"])
  end
end
