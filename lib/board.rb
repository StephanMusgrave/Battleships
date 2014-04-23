class Board

  def initialize(player)
    @rows = [row,row,row,row,row,row,row,row,row,row]
    @player = player  
    @inventory = {:destroyer => 3, :submarine => 2}
  end

  def row
  	["","","","","","","","","",""]
  end

  def rows
  	@rows
  end

  def inventory
    @inventory
  end

  def owner
    @player
  end

  # def place_ship(size, start_position)
  #   row = (start_position.chars[1].to_i) - 1
  #   column = (start_position.chars[0]) - 1
  #   populate(start_position)
  #   populate(start_position)
  #   populate(start_position)
  # end

  def char_to_int(letter)
    letter.capitalize.ord - 65
  end 

  def convert_coordinates(coordinates)
    row = (coordinates.chars[1].to_i) - 1
    column = char_to_int(coordinates.chars[0])
    array_coordinates = [row, column]
  end 

  def place_ship(size, direction, at_coordinates)
    coordinates = convert_coordinates(at_coordinates) 
    column = coordinates[1]
    row = coordinates[0] 
      if direction == "horizontal"  
        end_position = column + size - 1
      while column <= end_position  
        @rows[row][column] = "s"
        column += 1
      end
    else
      end_position = row + size - 1
      while row <= end_position  
        @rows[row][column] = "s"
        row += 1
      end
    end 
    @rows[row][column]
  end
  
  def register_shot(at_coordinates)
    coordinates = convert_coordinates(at_coordinates) 
    column = coordinates[1]
    row = coordinates[0]
    @rows[row][column] = hit?(at_coordinates)
    @rows[row][column]
  end

  def hit?(at_coordinates)
    return "o" if (position(at_coordinates) == "")
    return "x" if (position(at_coordinates) == "s")
    return "what?"
  end

  def position(at_coordinates)
    coordinates = convert_coordinates(at_coordinates) 
    column = coordinates[1]
    row = coordinates[0]
    # puts "#{@rows[row - 1][char_to_int(column)]}"
    @rows[row][column]
  end

  def opponent_view
    @rows.each do |row| 
      row.each do |el|
        el.gsub('s', '') 
      end
    end 
  end

end