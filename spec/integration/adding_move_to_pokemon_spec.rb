RSpec.describe "Adding a Move to a Pokemon", :integration do
  context "valid input" do
    let!(:trainer){ Trainer.create(name: "Ash") }
    let!(:pokemon){ Pokemon.create(name: "Pikachu", trainer: trainer, pokedex_id: "25", pokemon_type: "Electric") }
    let!(:output1){ run_plt_with_input("2", "1", "2", "1", "1", "Volt Switch") }
    let!(:output2){ run_plt_with_input("2", "1", "2", "1", "1", "Agility") }

    it "prints a success message" do
      expect(output1).to include("The move 'Volt Switch' has been registered to Pikachu")
    end

    it "should successfully save the move to the pokemon" do
      expect(Pokemon.last.moves).to include('Volt Switch')
    end

    it "should succesfully add a second move" do
      expect(output2).to include("The move 'Agility' has been registered to Pikachu")
    end

    it "should successfully save the move to the pokemon" do
      expect(Pokemon.last.moves).to include('Volt Switch / Agility')
    end
  end

  context "invalid input" do
    let!(:trainer){ Trainer.create(name: "Misty") }
    let!(:pokemon){ Pokemon.create(name: "Bulbasaur", trainer_id: "1", pokedex_id: "1", pokemon_type: "poison / grass") }

    context "empty string" do
      let!(:output){ run_plt_with_input("2", "1", "2", "1", "1", "") }
      it "prints an error message" do
        expect(output).to include("That move is not valid")
      end
      it "doesn't save to the database" do
        expect(Pokemon.last.moves).to be == ""
      end
    end

    context "string that is not a valid move" do
      let!(:output){ run_plt_with_input("2", "1", "2", "1", "1", "abc123") }
      it "prints an error message" do
        expect(output).to include("That move is not valid")
      end
      it "doesn't save to the database" do
        expect(Pokemon.last.moves).to be == ""
      end
    end

    context "move is not valid for pokemon" do
      let!(:output){ run_plt_with_input("2", "1", "2", "1", "1", "Thunderbolt") }
      it "prints an error message" do
        expect(output).to include("That move is not valid for this pokemon")
      end
      it "doesn't save to the database" do
        expect(Pokemon.last.moves).to be == ""
      end
    end

    context "pokemon already knows move" do
      let!(:output){ run_plt_with_input("2", "1", "2", "1", "1", "Tackle")
                     run_plt_with_input("2", "1", "2", "1", "1", "Tackle") }
      it "prints an error message" do
        expect(output).to include("This Pokemon already knows that move")
      end
      it "doesn't save to the database" do
        expect(Pokemon.last.moves).to be == "Tackle"
      end
    end
  end

  # context "Pokemon already has four moves" do
  #   let!(:trainer){ Trainer.create(name: "Brock") }
  #   let!(:pokemon){ Pokemon.create(name: "Onyx", trainer_id: "1", pokedex_id: "95", pokemon_type: "rock / ground") }
  #   let!(:output){ run_plt_with_input("2", "1", "2", "1", "1", "Tackle")
  #                  run_plt_with_input("2", "1", "2", "1", "1", "Harden")
  #                  run_plt_with_input("2", "1", "2", "1", "1", "Bind")
  #                  run_plt_with_input("2", "1", "2", "1", "1", "Mud Sport")
  #                  run_plt_with_input("2", "1", "2", "1", "1", "Rage") }

  #   it "should print an error message" do
  #     expect(output).to include("You have registered 4 moves to this pokemon already")
  #   end
  # end
end