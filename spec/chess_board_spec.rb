require "./lib/chess_board.rb"

describe ChessBoard do
  let(:chess) { ChessBoard.new }
  let(:pawn) { chess.instance_variable_get("@pawn") }

  describe "Initialize" do
    context "when I create Chess board object" do
      it "it should be an instance of ChessBoard class" do
        expect(chess).to be_an_instance_of(ChessBoard)
      end

      it "it should have Pawn object as Hash instance" do
        expect(pawn).to be_an_instance_of(Hash)
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

  describe "Set Position" do
    context "when I set pawn postion, direction and box" do
      let(:position) { {x: 1, y: 1, f: 'NORTH', c: 'BLACK'} }

      before do
        chess.set_position(position)
      end

      it "it should be at the give postion facing given direction and color box" do
        expect(pawn[:x]).to eql(1)
        expect(pawn[:y]).to eql(1)
        expect(pawn[:f]).to eql('NORTH')
        expect(pawn[:c]).to eql('BLACK')
      end
    end
  end

  describe "Get new box" do
    let(:position) { {x: 0, y: 0, f: 'NORTH', c: 'BLACK'} }

    before do
      chess.set_position(position)
    end

    context "when I call get new box with left direction and pawn is facing North" do
      let(:current_position) { chess.get_new_box('left') }

      it "it should update pawn's direction to West" do
        expect(current_position[:f]).to eql('WEST')
      end

      it "it should not update pawn's position" do
        expect(current_position[:x]).not_to eql(1)
        expect(current_position[:y]).not_to eql(2)
      end

      it "it should remain in same color box" do
        expect(current_position[:c]).to eql('BLACK')
      end
    end

    context "when I call get new box with right direction and pawn is facing NORTH" do
      let(:current_position) { chess.get_new_box('right') }

      it "it should update pawn's direction to EAST" do
        expect(current_position[:f]).to eql('EAST')
      end

      it "it should not update pawn's position" do
        expect(current_position[:x]).not_to eql(1)
        expect(current_position[:y]).not_to eql(2)
      end

      it "it should remain in same color box" do
        expect(current_position[:c]).to eql('BLACK')
      end
    end

    context "when I call get new box with forward direction and pawn is facing NORTH" do
      let(:current_position) { chess.get_new_box('forward') }

      it "it should not update pawn's direction to EAST" do
        expect(current_position[:f]).to eql('NORTH')
      end

      it "it should update pawn's position" do
        expect(current_position[:x]).to eql(0)
        expect(current_position[:y]).to eql(1)
      end

      it "it should change box color" do
        expect(current_position[:c]).to eql('WHITE')
      end
    end

    context "when I call get new box with forward direction with 4 steps and pawn is facing NORTH" do
      before do
        chess.set_position(position)
      end

      let(:current_position) { chess.get_new_box('forward', 4) }

      it "it should not update pawn's direction to EAST" do
        expect(current_position[:f]).to eql('NORTH')
      end

      it "it should update pawn's position" do
        expect(current_position[:x]).to eql(0)
        expect(current_position[:y]).to eql(4)
      end

      it "it should change box color" do
        expect(current_position[:c]).to eql('BLACK')
      end
    end


    context "when I call get_new_box with forward direction with 8 steps and pawn is facing NORTH" do
      before do
        chess.set_position(position)
      end

      let(:current_position) { chess.get_new_box('forward', 8) }

      it "it should not update pawn's direction to EAST" do
        expect(current_position[:f]).to eql('NORTH')
      end

      it "it should not update pawn's position" do
        expect(current_position[:x]).to eql(0)
        expect(current_position[:y]).to eql(0)
      end

      it "it should not change box color" do
        expect(current_position[:c]).to eql('BLACK')
      end
    end
  end
end