class Memosig::ProcStat
  def self.all
    ps = `ps ax -o pid,rss,command`.lines.to_a[1..-1]
    ps.map! { |l| from_line(l) }
  end

  def self.from_line(line)
    new(*line.lstrip.split(/\s+/, 3))
  end

  def initialize(pid, rss, command)
    @pid, @rss, @command = pid.to_i, rss.to_i, command
  end

  attr_reader :pid, :rss, :command
end
