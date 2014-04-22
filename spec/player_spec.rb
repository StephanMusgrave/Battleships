require 'player.rb'

describe Player do

	let(:player) {Player.new('Joey')}
	let(:board) {double :array}
	
it "has a name" do
	expect(player.name).to eq'Joey'
end

it "should have a board" do
	expect(player.board).not_to eq nil?
end

it "should know if ships are on its board" do 
	expect(player.has_ships_still_floating?).not_to eq true
end

end

