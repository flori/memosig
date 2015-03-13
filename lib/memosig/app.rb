require 'complex_config'
require 'memosig/proc_stat'

class Memosig::App
  def initialize(config: nil)
    @config = ComplexConfig::Provider.config(config)
  end

  def run
    check_memory
    sleep (@config.wait_period || 300)
  end

  private

  def process_prefix
    "#{File.basename($0)} pid=#$$"
  end

  def output(message)
    STDOUT.puts "#{process_prefix} #{message}"
    STDOUT.flush
  end

  def error(message)
    STDERR.puts "#{process_prefix} #{message}"
    STDERR.flush
  end

  def check_memory_for(pattern, config, processes)
    matched = false
    for process in processes
      if process.command =~ pattern
        if process.rss > config['rss_max']
          output "restarting process pid=#{process.pid} "\
            "pattern=#{pattern.source.inspect} "\
            "rss #{process.rss}>#{config['rss_max']}"
          Process.kill config['signal'], process.pid
        else
          output "no action on process pid=#{process.pid} "\
            "pattern=#{pattern.source.inspect} "\
            "rss #{process.rss}<=#{config['rss_max']}"
        end
        matched = true
      end
    end

    unless matched
      error "pattern #{pattern.source.inspect} didn't match any processes"
    end
  end

  def check_memory
    output "checking memory limits"
    processes = Memosig::ProcStat.all
    for (pattern, config) in Array(@config.processes)
      pattern = Regexp.new(pattern.to_s)
      check_memory_for pattern, config, processes
    end
  end
end
