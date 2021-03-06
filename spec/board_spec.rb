require 'board'

describe Board do
  let (:board) {Board.new("Will") }

  it 'initializes a new player' do
  	expect(board.owner).to eq "Will"
  end

  context "Initializing Board" do
    it 'a row should have 10 positions' do
    expect(board.row.count).to eq 10
    end

    it 'board should have 10 rows' do
      expect(board.rows.count).to eq 10
    end

    it 'can convert A1 format to array coordinates' do
      expect(board.convert_coordinates("A1")).to eq([0,0])
    end

    it 'can populate board with ships' do
      board.place_ship(1, "horizontal", "A1")
      expect(board.position("A1")).to eq "s"
    end

    it 'can place a ship on a row' do
      board.place_ship(3, "horizontal", "A1")
      expect(board.position("A1")).to eq 's'
      expect(board.position("B1")).to eq 's'
      expect(board.position("C1")).to eq 's'
    end

    it 'can place a ship on a column' do
      board.place_ship(4, "vertical", "F2")
      expect(board.position("F2")).to eq 's'
      expect(board.position("F3")).to eq 's'
      expect(board.position("F4")).to eq 's'
      expect(board.position("F5")).to eq 's'
    end

    it "has an inventory of ships" do
      expect(board.inventory).to eq ([5,4,3,3,2])
    end

    it "can generate a random start point" do
      allow(board).to receive(:random_coords) {"A3"}
      expect(board.random_coords).to eq "A3"
    end

    it "can generate a random direction" do
      allow(board).to receive(:random_direction) {"horizontal"}
      expect(board.random_direction).to eq "horizontal"
    end

    it "can place a ship in a random position with a random direction" do
      begin
        board.place_ship(3, board.random_direction, board.random_coords)
      rescue
        puts ">>> #{board}"
      end

      expect(board.rows.flatten.count("s")).to eq 3
    end

    it "a ship cannot be placed vertically outside of the board" do
      expect(board.can_place_ship?(2, "vertical", "A10")).to be_false    
    end

    it "a ship cannot be placed horizontally outside of the board" do
      expect(board.can_place_ship?(3, "horizontal", "J9")).to be_false
    end

    it "a ship can be placed horizontally inside of the board" do
      expect(board.can_place_ship?(6, "horizontal", "E2")).to be_true    
    end

    it "a ship can be placed vertically inside of the board" do
      expect(board.can_place_ship?(6, "vertical", "A5")).to be_true    
    end

    it 'cannot place a ship on top of another ship' do
      board.place_ship(5, "horizontal","b4")
      expect(board.check_empty_sea?(5, "vertical","d3")).to be_false
    end
    it 'can place a ship when it doesnt overlap another ship' do
      board.place_ship(5, "vertical","b4")
      expect(board.check_empty_sea?(5, "vertical","d3")).to be_true
    end
    
    it 'cannot place a ship on top of another ship' do
      board.place_ship(5, "horizontal","b4")
      expect(board.can_place_ship?(5, "vertical","d3")).to be_false
    end
    it 'can place a ship when it doesnt overlap another ship' do
      board.place_ship(5, "vertical","b4")
      expect(board.can_place_ship?(5, "vertical","d3")).to be_true
    end

    it 'can place the inventory of ships on the board' do
      board.place_inventory
      expect(board.rows.flatten.count("s")).to eq 17
      print board
    end
    
  end
  
  context "Playing the game" do
    
    it "can hit water" do
      expect(board.register_shot("B3")).to eq "o"
    end

    it 'can hit a ship' do
      board.place_ship(1, "horizontal", "J3")
      expect(board.register_shot("J3")).to eq "x"
    end 

    it 'shows the openents view of my board without ships' do
      board.place_ship(1, "horizontal", "A3")
      expect(board.opponent_view.include?("s")).to be_false
    end



  end

end