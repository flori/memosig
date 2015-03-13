require 'memosig/output'

class ::Memosig::Matcher
  include Memosig::Output

  def initialize(pattern, config)
    @pattern, @config = pattern, config
  end

  def match?(process)
    if process.command =~ @pattern
      if process.rss > @config.rss_max
        output "restarting process pid=#{process.pid} "\
          "pattern=#{@pattern.source.inspect} "\
          "rss #{process.rss}>#{@config.rss_max}"
          Process.kill @config.signal, process.pid
      else
        output "no action on process pid=#{process.pid} "\
          "pattern=#{@pattern.source.inspect} "\
          "rss #{process.rss}<=#{@config.rss_max}"
      end
      matched = true
    end
  end
end
