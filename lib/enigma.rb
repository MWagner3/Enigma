class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end


  def generate_key
    rand(99999).to_s.rjust(5, "0")
  end

  def today_date
    Date.today.strftime("%m%d%y")
  end

  def create_key_hash(key_string) # "54321"
    key_hash = {}
    key_hash[:A] = key_string[0..1].to_i
    key_hash[:B] = key_string[1..2].to_i
    key_hash[:C] = key_string[2..3].to_i
    key_hash[:D] = key_string[3..4].to_i
    key_hash
  end

  

  def encrypt(message, key = generate_key, date = today_date)

    # result = {}
    #
    # keys =
    #   A
    #   B
    #   C
    #   D
    #
    # offsets =
    #   A
    #   B
    #   C
    #   D
    #
    #
    # keys + offsets = shift values

  end





end
