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
  
  def register_shot_at_coordinates(column, row)
    @rows[row - 1][position_of_(column)] = "o"
  end

  def position(column, row)
    @rows[row - 1][position_of_(column)]
  end

end