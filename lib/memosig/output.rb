module Memosig::Output
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
end
