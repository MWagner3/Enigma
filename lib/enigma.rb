class Enigma

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = generate_key, date = today_date)

  end

end
