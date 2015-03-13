require 'spec_helper'

RSpec.describe Memosig::App do
  let :config do
    'spec/assets/memosig.yml'
  end

  let :app do
    Memosig::App.new(config: config)
  end

  it 'loads config' do
    expect(app.config).to be_a ComplexConfig::Settings
  end

  it 'checks the memory and sleeps if run' do
    expect(app).to receive(:check_memory)
    expect(app).to receive(:sleep)
    app.run
  end
end
