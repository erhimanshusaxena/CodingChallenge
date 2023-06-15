require "./lib/game.rb"

describe Game do
  let(:game) { Game.new }
  let(:chess) { game.instance_variable_get("@chess") }
  let(:game_start) { game.instance_variable_get("@game_start") }
  let(:pawn) { chess.instance_variable_get("@pawn") }

  describe "Initialize" do
    context "when I create Game object" do
      it "it should have an instance of Chess class" do
        expect(chess).to be_an_instance_of(ChessBoard)
      end

      it "it should have Pawn object as Hash instance" do
        expect(pawn).to be_an_instance_of(Hash)
      end

      it "it should have game_start instance_variable with value true" do
        expect(game_start).to eql(false)
      end

      it "it should have Pawn object with initial position 0,0" do
        expect(pawn[:x]).to eql(0)
        expect(pawn[:y]).to eql(0)
      end

      it "it should have Pawn object with initial direction as nil" do
        expect(pawn[:f]).to eql(nil)
      end

      it "it should have Pawn object with initial box color value as nil" do
        expect(pawn[:c]).to eql(nil)
      end
    end
  end

  describe "Game#valid_command?" do
    context "when input is nil" do
      let(:valid_command) { game.valid_command?(nil) }

      it "should return false" do
        expect(valid_command).to eql(false)
      end
    end

    context "when input is not nil but a string with invalid value" do
      let(:valid_command) { game.valid_command?('1,2,3,4') }

      it "should return false" do
        expect(valid_command).to eql(false)
      end
    end

    context "when input is not nil but a string with valid position with invalid direction value" do
      let(:valid_command) { game.valid_command?('1,2,N,G') }

      it "should return false" do
        expect(valid_command).to eql(false)
      end
    end

    context "when input is not nil but a string with valid position direction but invalid color value" do
      let(:valid_command) { game.valid_command?('1,2,NORTH,G') }

      it "should return false" do
        expect(valid_command).to eql(false)
      end
    end

    context "when input is not nil but a string with valid position, direction and color value" do
      let(:valid_command) { game.valid_command?('0,0,NORTH,BLACK') }

      it "should return true" do
        expect(valid_command).to eql(true)
      end
    end
  end

  describe "Game#end" do
    context "calling end method" do
      it "should call system exist" do
        expect { game.end_game }.to raise_error(SystemExit)
      end
    end
  end
end