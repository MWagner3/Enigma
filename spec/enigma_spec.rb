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


  it '#generate_key' do

    expect(enigma.generate_key).to be_a(String)
    expect(enigma.generate_key.length).to eq(5)
  end

  it 'today_date' do

    expect(enigma.today_date).to be_a(String)
    expect(enigma.today_date.length).to eq(6)
  end

  xit '#encrypt returns a hash with three keys' do

    expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
  end
end
