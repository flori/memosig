require 'spec_helper'

RSpec.describe Memosig::App do
  let :config do
    'spec/assets/memosig.yml'
  end

  let :app do
    Memosig::App.new(config: config)
  end

  let :current_processes do
    [ Memosig::ProcStat.new($$, 666, 'unicorn worker') ]
  end

  before do
    allow(app).to receive(:sleep)
    allow(app).to receive(:current_processes).and_return(current_processes)
  end

  it 'loads config' do
    expect(app.config).to be_a ComplexConfig::Settings
  end

  it 'can gather process information' do
    expect(
      Memosig::App.new(config: config).instance_eval { current_processes }
    ).not_to be_empty
  end

  context '#run' do
    it 'checks the memory and sleeps' do
      expect(app).to receive(:check_memory)
      expect(app).to receive(:sleep)
      app.run
    end
  end

  context '#check_memory' do
    it 'fetches all current processes' do
      allow(app).to receive(:check_memory_for)
      expect(app).to receive(:check_memory_for).with(
        :'unicorn worker',
        app.config.processes[:'unicorn worker'],
        current_processes
      )
      expect(app).to receive(:output).with /checking memory limits/
      app.instance_eval { check_memory }
    end

    it 'calls check_memory_for for each pattern and config' do
      allow(app).to receive(:output)
      expect(app).to receive(:check_memory_for).with(
        :'unicorn worker',
        app.config.processes[:'unicorn worker'],
        current_processes
      )
      expect(app).to receive(:check_memory_for).with(
        :'\Asidekiq ',
        app.config.processes[:'\Asidekiq '],
        current_processes
      )
      app.instance_eval { check_memory }
    end
  end

  context '#check_memory_for' do
    after do
      app.instance_eval do
        check_memory_for(
          :'unicorn worker',
          config.processes[:'unicorn worker'],
          current_processes
        )
      end
    end

    it 'can match' do
      expect_any_instance_of(Memosig::Matcher).to receive(:match?).with(
        current_processes.first
      ).and_return true
      expect(app).not_to receive(:error).with(
        /pattern "unicorn worker" didn't match any processes/
      )
    end

    it 'cannot match' do
      expect_any_instance_of(Memosig::Matcher).to receive(:match?).with(
        current_processes.first
      ).and_return false
      expect(app).to receive(:error).with(
        /pattern "unicorn worker" didn't match any processes/
      )
    end

    context 'more processes' do
      let :current_processes do
        [
          Memosig::ProcStat.new($$, 666, 'unicorn worker[1]'),
          Memosig::ProcStat.new($$, 666, 'unicorn worker[2]'),
        ]
      end

      it 'can match and not match' do
        expect(app).to receive(:new_matcher).and_return(double(match?: false))
        expect(app).to receive(:new_matcher).and_return(double(match?: true))
        expect(app).not_to receive(:error).with(
          /pattern "unicorn worker" didn't match any processes/
        )
      end
    end
  end
end
