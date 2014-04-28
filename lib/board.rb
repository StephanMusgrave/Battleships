class Board

  def initialize(player)
    @rows = [row,row,row,row,row,row,row,row,row,row]
    @player = player  
    @inventory = [5,4,3,3,2]
    # place_inventory
  end

  def row
  	["","","","","","","","","",""]
  end

  def rows
  	@rows
  end
  
  def to_s
    "Hello"
  end

  def inventory
    @inventory
  end

  def owner
    @player
  end

  def ship_count
    rows.flatten.count("s")
  end
    

  def place_inventory
    @inventory.each do|ship|
      direction = random_direction
      coords = random_coords
      while !(can_place_ship?(ship,direction,coords))
        # puts "while loop triggered"
        direction = random_direction
        coords = random_coords
      end
      place_ship(ship,direction,coords)
    end
  end

  def random_coords
    column = [*"A".."J"].sample
    row = [*1..10].sample

    coordinates = "#{column}#{row}"
  end

  def random_direction
    ["horizontal", "vertical"].sample
  end

  def can_place_ship?(size,direction,coordinates)
    board_check?(size,direction,coordinates) && check_empty_sea?(size,direction,coordinates)
  end

  def board_check?(size,direction,coordinates)
    coordinates = convert_coordinates(coordinates) 
    column = coordinates[1]
    row = coordinates[0] 
    if direction == "horizontal"  
      end_position = column + size - 1
      return (end_position <= 9)
    elsif direction == "vertical"
      end_position = row + size - 1
      return (end_position <= 9)
    else
      true
    end
  end

  def check_empty_sea?(size,direction,coordinates)
    coordinates = convert_coordinates(coordinates) 
    column = coordinates[1]
    row = coordinates[0] 
      if direction == "horizontal"  
        end_position = column + size - 1
      while column <= end_position  
        return false if @rows[row][column] == "s"
        column += 1
      end
    else
      end_position = row + size - 1
      while row <= end_position  
        return false if @rows[row][column] == "s"
        row += 1
      end
    end 
    true
  end

  def char_to_int(letter)
    letter.capitalize.ord - 65
  end 

  def convert_coordinates(coordinates)
    row = (coordinates[1..-1].to_i) - 1
    column = char_to_int(coordinates[0])
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
      return @rows[row][column - 1]
    else
      end_position = row + size - 1
      while row <= end_position  
        @rows[row][column] = "s"
        row += 1
      end
      return @rows[row - 1][column]
    end
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
      row.each do |element|
        element.gsub('s', '') 
      end
    end 
  end

end