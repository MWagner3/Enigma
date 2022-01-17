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

  it '#today_date' do

    expect(enigma.today_date).to be_a(String)
    expect(enigma.today_date.length).to eq(6)
  end

  it '#create_key_hash' do

    expect(enigma.create_key_hash('54321')).to be_a(Hash)
    expect(enigma.create_key_hash('54321').keys.length).to be(4)

  end

  it '#create_offset_hash' do

    expect(enigma.create_offset_hash("011522")).to be_a(Hash)
    expect(enigma.create_offset_hash("011522").count).to eq(4)

  end

  it '#create_shift_values_hash' do
    enigma.create_key_hash('54321')
    enigma.create_offset_hash("011522")
    expect(enigma.create_shift_values_hash)
  end

  it '#message_to_array breakes message onto array of characters' do
    expect(enigma.message_characters).to eq([])
    enigma.message_to_array('hello')
    expect(enigma.message_characters).to eq(['h', 'e', 'l', 'l', 'o'])
    enigma.message_to_array('HeLlO')
    expect(enigma.message_characters).to eq(['h', 'e', 'l', 'l', 'o'])
  end

  it '#convert_character' do
    enigma.create_key_hash("54321")
    enigma.create_offset_hash("011522")
    enigma.create_shift_values_hash
    expect(enigma.convert_character('h')).to eq('n')
    expect(enigma.convert_character('e')).to eq('y')
    expect(enigma.convert_character('l')).to eq('y')
    expect(enigma.convert_character('l')).to eq('j')
    expect(enigma.convert_character('o')).to eq('u')
  end

  it '#convert_message' do

    enigma.create_key_hash("54321")
    enigma.create_offset_hash("011522")
    enigma.create_shift_values_hash
    expect(enigma.convert_message('hello')).to eq("nyyju")
  end

  it '#encrypt returns a hash with three keys, can generate key and date if none are provided' do

    expect(enigma.encrypt("hello world", "54321", "011522")).to be_a(Hash)
    expect(enigma.encrypt("hello world", "54321").to be_a(Hash)
    expect(enigma.encrypt("hello world").to be_a(Hash)
  end
end
