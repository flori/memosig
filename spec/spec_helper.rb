if ENV['START_SIMPLECOV'].to_i == 1
  require 'simplecov'
  SimpleCov.start do
    add_filter "#{File.basename(File.dirname(__FILE__))}/"
  end
end

require 'rspec'
begin
  require 'byebug'
rescue LoadError
end
require 'memosig'

def config_dir
  Pathname.new(__FILE__).dirname + "config"
end

def asset(name)
  config_dir + name
end
