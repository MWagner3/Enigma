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

  def create_key_array(key) #12245
    key_array = []
    key_array
    key_array
    key_array
    key_array
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
