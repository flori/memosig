require 'spec_helper'

RSpec.describe Memosig::Output do
  let :object do
    Object.new.tap do |o|
      o.extend(Memosig::Output)
    end
  end

  it 'can generate the process_prefix' do
    expect(object.process_prefix).to match /\w+ pid=\d+/
  end

  it 'can output messages with prefix' do
    expect(STDOUT).to receive(:puts).with /\w+ pid=\d+.*foo/
    object.output 'foo'
  end

  it 'can output error messages with prefix' do
    expect(STDERR).to receive(:puts).with /\w+ pid=\d+.*foo/
    object.error 'foo'
  end
end
