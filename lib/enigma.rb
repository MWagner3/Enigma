class Enigma

  attr_reader :character_set, :message_characters, :encrypted_message

  def initialize
    @character_set = ("a".."z").to_a << " "
    @key_hash = {}
    @offset_hash = {}
    @shift_hash = {}
    @message_characters = []
  end


  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def today_date
    Date.today.strftime("%m%d%y")
  end

  def create_key_hash(key_string) # "54321"
    @key_hash[:A] = key_string[0..1].to_i
    @key_hash[:B] = key_string[1..2].to_i
    @key_hash[:C] = key_string[2..3].to_i
    @key_hash[:D] = key_string[3..4].to_i
    @key_hash
  end

  def create_offset_hash(today_date) # "011522"
    @offset_hash[:A] = (today_date.to_i ** 2).to_s.reverse[3].reverse.to_i
    @offset_hash[:B] = (today_date.to_i ** 2).to_s.reverse[2].reverse.to_i
    @offset_hash[:C] = (today_date.to_i ** 2).to_s.reverse[1].reverse.to_i
    @offset_hash[:D] = (today_date.to_i ** 2).to_s.reverse[0].reverse.to_i
    @offset_hash
  end

  def create_shift_values_hash
    @shift_hash[:A] = @offset_hash[:A] + @key_hash[:A]
    @shift_hash[:B] = @offset_hash[:B] + @key_hash[:B]
    @shift_hash[:C] = @offset_hash[:C] + @key_hash[:C]
    @shift_hash[:D] = @offset_hash[:D] + @key_hash[:D]
    @shift_hash
  end

  def message_to_array(message) #'hello' => ['h', 'e', 'l', 'l', 'o']
    @message_characters = message.downcase.split(//)
  end

  def convert_character(character)
    @number += 1
     if @number == 1
       character_index = @character_set.index(character)
       converted_character = @character_set.rotate(character_index + @shift_hash[:A])[0]
     elsif @number == 2
       character_index = @character_set.index(character)
       converted_character = @character_set.rotate(character_index + @shift_hash[:B])[0]
     elsif @number == 3
       character_index = @character_set.index(character)
       converted_character = @character_set.rotate(character_index + @shift_hash[:C])[0]
     elsif @number == 4
       @number = 0
       character_index = @character_set.index(character)
       converted_character = @character_set.rotate(character_index + @shift_hash[:D])[0]
     end
     converted_character
   end

  def encrypt(message, key = generate_key, date = today_date)

  #   result = {
  #   encryption: x,
  #   key:        key,
  #   date:       date
  # }


  end





end
