class Board

  def initialize(player)
    @rows = [row,row,row,row,row,row,row,row,row,row]
    @player = player  
  end

  def row
  	["","","","","","","","","",""]
  end

  def rows
  	@rows
  end

  def owner
    @player
  end

  def char_to_int(letter)
    letter.capitalize.ord - 65
  end 

  def populate(at_coordinates)
    row = at_coordinates.chars[1].to_i
    column = at_coordinates.chars[0]
    @rows[row - 1][char_to_int(column)] = "s"
    @rows[row - 1][char_to_int(column)]
  end
  
  def register_shot(at_coordinates)
    row = at_coordinates.chars[1].to_i
    column = at_coordinates.chars[0]
    @rows[row - 1][char_to_int(column)] = hit?(at_coordinates)
    @rows[row - 1][char_to_int(column)]
  end

  def hit?(at_coordinates)
    return "o" if (position(at_coordinates) == "")
    return "x" if (position(at_coordinates) == "s")
    return "what?"
  end

  def position(at_coordinates)
    row = at_coordinates.chars[1].to_i
    column = at_coordinates.chars[0]
    puts "#{@rows[row - 1][char_to_int(column)]}"
    @rows[row - 1][char_to_int(column)]
  end

end