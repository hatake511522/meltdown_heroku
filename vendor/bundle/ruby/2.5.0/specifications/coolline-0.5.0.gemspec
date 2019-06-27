# -*- encoding: utf-8 -*-
# stub: coolline 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "coolline".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mon ouie".freeze]
  s.date = "2014-09-14"
  s.description = "A readline-like library that allows to change how the input\nis displayed.\n".freeze
  s.email = "mon.ouie@gmail.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://github.com/Mon-Ouie/coolline".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Sounds like readline, smells like readline, but isn't readline".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<unicode_utils>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<riot>.freeze, [">= 0"])
    else
      s.add_dependency(%q<unicode_utils>.freeze, ["~> 1.4"])
      s.add_dependency(%q<riot>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<unicode_utils>.freeze, ["~> 1.4"])
    s.add_dependency(%q<riot>.freeze, [">= 0"])
  end
end
