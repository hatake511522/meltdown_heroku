# -*- encoding: utf-8 -*-
# stub: pry-coolline 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "pry-coolline".freeze
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Mair (banisterfiend)".freeze]
  s.date = "2014-09-14"
  s.description = "Live syntax-highlighting for the Pry REPL".freeze
  s.email = "jrmair@gmail.com".freeze
  s.homepage = "https://github.com/pry/pry-coolline".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Live syntax-highlighting for the Pry REPL".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<coolline>.freeze, ["~> 0.5"])
      s.add_development_dependency(%q<riot>.freeze, [">= 0"])
    else
      s.add_dependency(%q<coolline>.freeze, ["~> 0.5"])
      s.add_dependency(%q<riot>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<coolline>.freeze, ["~> 0.5"])
    s.add_dependency(%q<riot>.freeze, [">= 0"])
  end
end
