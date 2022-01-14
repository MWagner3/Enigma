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
end
