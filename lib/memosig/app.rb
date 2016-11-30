require 'complex_config'
require 'memosig/proc_stat'
require 'memosig/output'
require 'memosig/matcher'

class Memosig::App
  include Memosig::Output

  def initialize(config: nil)
    @config = ComplexConfig::Provider.config(config)
  end

  attr_reader :config

  def run
    check_memory
    sleep (@config.wait_period? || 300)
  end

  private

  def new_matcher(pattern, config)
    Memosig::Matcher.new(pattern, config)
  end

  def check_memory_for(pattern, config, processes)
    processes.inject(false) do |matched, process|
      m = new_matcher(pattern, config).match?(process)
      matched || m
    end and return
    error "pattern #{pattern.to_s.inspect} didn't match any processes"
  end

  def current_processes
    Memosig::ProcStat.all
  end

  def check_memory
    output "checking memory limits"
    processes = current_processes
    for (pattern, config) in @config.processes
      check_memory_for pattern, config, processes
    end
  end
end
