require 'spec_helper'

RSpec.describe Memosig::ProcStat do
  let :processes do
    Memosig::ProcStat.all
  end

  it 'gathers all process statistics' do
    expect(processes.size).to be > 0
  end

  it 'has a PID per line' do
    expect(processes.first.pid).to be_a Integer
    expect(processes.first.pid).to be > 0
  end

  it 'has a RSS per line' do
    expect(processes.first.rss).to be_a Integer
    expect(processes.first.rss).to be > 0
  end

  it 'has a command per line' do
    expect(processes.first.command).to be_a String
    expect(processes.first.command.size).to be > 0
  end
end
