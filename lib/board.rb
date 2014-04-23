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

  def position_of_(letter)
    letter.capitalize.ord - 65
  end 

  def populate(at_coordinates)
    row = at_coordinates.chars[1].to_i
    column = at_coordinates.chars[0]
    @rows[row - 1][position_of_(column)] = "s"
    @rows[row - 1][position_of_(column)]
  en
  end
  
  def register_shot(at_coordinates)
    row = at_coordinates.chars[1].to_i
    column = at_coordinates.chars[0]
    @rows[row - 1][position_of_(column)] = "o"
    @rows[row - 1][position_of_(column)]
  end

  # def position(at_coordinates)
  #   row = at_coordinates.chars[1].to_i
  #   column = at_coordinates.chars[0]
  #   @rows[row - 1][position_of_(column)]
  # end

end