require 'spec_helper'
require 'timeout'

RSpec.describe Memosig::Matcher do
  let :config do
    ComplexConfig::Settings[
      rss_max: 666,
      signal:  14,
    ]
  end

  let :matcher do
    Memosig::Matcher.new('command\z', config)
  end

  context '#match?' do
    it 'does nothing if command does not match pattern' do
      process = Memosig::ProcStat.new($$, 4242, 'not what we are looking for')
      expect(matcher).not_to receive(:take_action)
      expect(matcher).not_to receive(:lay_low)
      expect(matcher).not_to be_match process
    end

    it 'takes action if rss > configured rss_max' do
      process = Memosig::ProcStat.new($$, 4242, 'our cool command')
      expect(matcher).to receive(:take_action)
      expect(matcher).not_to receive(:lay_low)
      expect(matcher).to be_match process
    end

    it 'lays low if rss <= configured rss_max' do
      process = Memosig::ProcStat.new($$, 23, 'our cool command')
      expect(matcher).not_to receive(:take_action)
      expect(matcher).to receive(:lay_low)
      expect(matcher).to be_match process
    end
  end

  context '#take_action' do
    it 'signals process if take action is called' do
      process = Memosig::ProcStat.new($$, 4242, 'our cool command')
      expect(matcher).to receive(:take_action).and_call_original
      expect(matcher).to receive(:output).with /sending signal 14 to process/
      alrm = false
      trap(:ALRM) { alrm = true }
      expect(matcher).to be_match process
      Timeout.timeout(1) { sleep 0.1 until alrm } rescue Timeout::Error
      expect(alrm).to eq true
    end
  end

  context '#lay_low' do
    it 'outputs a message if laying low' do
      process = Memosig::ProcStat.new($$, 23, 'our cool command')
      expect(matcher).to receive(:lay_low).and_call_original
      expect(matcher).to receive(:output).with /no action on process/
      expect(matcher).to be_match process
    end
  end
end
