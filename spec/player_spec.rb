require 'player.rb'

describe Player do

	let(:player) {Player.new('Joey')}

	
it "has a name" do
	expect(player.name).to eq'Joey'
end


end