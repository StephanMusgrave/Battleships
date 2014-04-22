class Board
require_relative 'array_methods'

  include ArrayMethods

  def initialize
    @rows = [row,row,row,row,row,row,row,row,row,row]
  end

  def row
  	["","","","","","","","","",""]
  end

  def rows
  	@rows
  end

  
end