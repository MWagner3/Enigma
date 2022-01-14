require 'simplecov'
SimpleCov.start
require './lib/enigma'
require 'date'
require 'rspec'
require 'pry'

RSpec.describe Enigma do

  let(:enigma) {Enigma.new}

  it 'exists' do
    expect(enigma).to be_an_instance_of(Enigma)
  end

  it  'has a #character_set' do

    expect(enigma.character_set).to be_a(Array)
    expect(enigma.character_set.count).to eq(27)
  end
end
