# -*- encoding: utf-8 -*-
# stub: memosig 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "memosig".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florian Frank".freeze]
  s.date = "2016-11-30"
  s.description = "This excecutable supervises the memory usage of processes, and sends a configurable signal to them if a configured limit is exceeded.".freeze
  s.email = "flori@ping.de".freeze
  s.executables = ["memosig".freeze]
  s.extra_rdoc_files = ["README.md".freeze, "lib/memosig.rb".freeze, "lib/memosig/app.rb".freeze, "lib/memosig/matcher.rb".freeze, "lib/memosig/output.rb".freeze, "lib/memosig/proc_stat.rb".freeze, "lib/memosig/version.rb".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, ".utilsrc".freeze, "COPYING".freeze, "Gemfile".freeze, "README.md".freeze, "Rakefile".freeze, "VERSION".freeze, "bin/memosig".freeze, "lib/memosig.rb".freeze, "lib/memosig/app.rb".freeze, "lib/memosig/matcher.rb".freeze, "lib/memosig/output.rb".freeze, "lib/memosig/proc_stat.rb".freeze, "lib/memosig/version.rb".freeze, "memosig.gemspec".freeze, "spec/assets/memosig.yml".freeze, "spec/memosig/app_spec.rb".freeze, "spec/memosig/matcher_spec.rb".freeze, "spec/memosig/output_spec.rb".freeze, "spec/memosig/proc_stat_spec.rb".freeze, "spec/spec_helper.rb".freeze]
  s.homepage = "http://flori.github.com/memosig".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rdoc_options = ["--title".freeze, "Memosig".freeze, "--main".freeze, "README.md".freeze]
  s.rubygems_version = "2.6.8".freeze
  s.summary = "Executable that supervises memory use of processes and signals them".freeze
  s.test_files = ["spec/memosig/app_spec.rb".freeze, "spec/memosig/matcher_spec.rb".freeze, "spec/memosig/output_spec.rb".freeze, "spec/memosig/proc_stat_spec.rb".freeze, "spec/spec_helper.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<tins>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<complex_config>.freeze, ["~> 0.9"])
    else
      s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<tins>.freeze, ["~> 1.0"])
      s.add_dependency(%q<complex_config>.freeze, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<gem_hadar>.freeze, ["~> 1.9.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<tins>.freeze, ["~> 1.0"])
    s.add_dependency(%q<complex_config>.freeze, ["~> 0.9"])
  end
end
