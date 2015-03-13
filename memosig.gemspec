# -*- encoding: utf-8 -*-
# stub: memosig 0.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "memosig"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Florian Frank"]
  s.date = "2015-03-13"
  s.description = "This excecutable supervises the memory usage of processes, and sends a configurable signal to them if a configured limit is exceeded."
  s.email = "flori@ping.de"
  s.extra_rdoc_files = ["README.md", "lib/memosig.rb", "lib/memosig/app.rb", "lib/memosig/proc_stat.rb", "lib/memosig/version.rb"]
  s.files = [".gitignore", "COPYING", "Gemfile", "README.md", "Rakefile", "VERSION", "bin/memosig", "lib/memosig.rb", "lib/memosig/app.rb", "lib/memosig/proc_stat.rb", "lib/memosig/version.rb", "memosig.gemspec", "spec/assets/memosig.yml", "spec/spec_helper.rb"]
  s.homepage = "http://flori.github.com/memosig"
  s.rdoc_options = ["--title", "Memosig", "--main", "README.md"]
  s.rubygems_version = "2.4.5"
  s.summary = "Executable that supervises memory use of processes and signals them"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<tins>, ["~> 1.0"])
      s.add_runtime_dependency(%q<complex_config>, [">= 0"])
    else
      s.add_dependency(%q<gem_hadar>, ["~> 1.0.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<tins>, ["~> 1.0"])
      s.add_dependency(%q<complex_config>, [">= 0"])
    end
  else
    s.add_dependency(%q<gem_hadar>, ["~> 1.0.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<tins>, ["~> 1.0"])
    s.add_dependency(%q<complex_config>, [">= 0"])
  end
end