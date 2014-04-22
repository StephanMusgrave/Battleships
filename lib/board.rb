class Board
require_relative 'array_methods'

  include ArrayMethods

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

end