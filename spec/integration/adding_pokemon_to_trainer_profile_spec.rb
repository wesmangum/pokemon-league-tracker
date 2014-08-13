RSpec.describe "Adding Pokemon to Trainer Profile", :integration do
  context "valid input" do
    let!(:trainer1){ Trainer.create(name: "Ash") }
    let!(:trainer2){ Trainer.create(name: "Gary") }

    it "prints a success message" do
      output = run_plt_with_input("2", "1", "1", "25")
      expect(output).to include("Congratulations! Your Pikachu has been registered.")
    end

    it "prints the pokemon on the profile menu" do
      output = run_plt_with_input("2", "1", "1", "25")
      expect(output).to include('1. Pikachu')
    end
  end

  context "invalid input" do
    let!(:trainer){ Trainer.create(name: "Misty") }

    context "empty string" do
      let!(:output){ run_plt_with_input("2", "1", "1", "") }
      it "prints an error message" do
        expect(output).to include("That ID is not valid")
      end
      it "doesn't save to the database" do
        expect(trainer.pokemons.count).to be == 0
      end
    end

    context "string that is not a valid integer" do
      let!(:output){ run_plt_with_input("2", "1", "1", "abc123") }
      it "prints an error message" do
        expect(output).to include("That ID is not valid")
      end
      it "doesn't save to the database" do
        expect(trainer.pokemons.count).to be == 0
      end
    end
  end

  context "Trainer already has six Pokemon" do
    let!(:trainer){ Trainer.create(name: "Ash") }

    it "should print an error message" do
      6.times do
        Pokemon.create(name: "Pikachu", pokedex_id: "25", trainer_id: trainer.id.to_s, pokemon_type: "Electric")
      end
      output = run_plt_with_input("2", "1", "1", "25")
      expect(output).to include("You have registered 6 pokemon already")
    end
  end
end