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

  def place_ship(size, at_coordinates)
    row = (at_coordinates.chars[1].to_i) - 1
    column = char_to_int(at_coordinates.chars[0]) 
    for(column <= size ; column++) {@rows[row][column] = "s"}

    @rows[row][column]
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
    # puts "#{@rows[row - 1][char_to_int(column)]}"
    @rows[row - 1][char_to_int(column)]
  end

  def opponent_view
    @rows.each do |row| 
      row.each do |el|
        el.gsub('s', '') 
      end
    end 
  end

end