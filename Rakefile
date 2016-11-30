# vim: set filetype=ruby et sw=2 ts=2:

require 'gem_hadar'

GemHadar do
  name        'memosig'
  author      'Florian Frank'
  email       'flori@ping.de'
  homepage    "http://flori.github.com/#{name}"
  summary     'Executable that supervises memory use of processes and signals them'
  description 'This excecutable supervises the memory usage of processes, '\
              'and sends a configurable signal to them if a configured limit '\
              'is exceeded.'
  test_dir    'spec'
  ignore      '.*.sw[pon]', 'pkg', 'Gemfile.lock', 'coverage', '.rvmrc',
    '.AppleDouble', 'errors.lst', '.byebug_history'
  readme      'README.md'
  title       "#{name.camelize}"
  licenses    << 'Apache-2.0'

  executables << 'memosig'

  dependency  'tins', '~>1.0'
  dependency  'complex_config', '~>0.9'
  development_dependency 'rake'
  development_dependency 'rspec'
  development_dependency 'simplecov'
  development_dependency 'byebug'
end

task :default => :spec
