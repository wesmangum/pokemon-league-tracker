RSpec.describe "Access the individual Pokemon Menu", :integration do
  let!(:trainer){ Trainer.create(name: "Ash") }
  let!(:pokemon){ Pokemon.create(name: "Pikachu", trainer_id: "1", pokedex_id: "25", pokemon_type: "Electric") }
  context "prints the pokemon menu" do
    it "should display the profile command screen" do
      output = run_plt_with_input("2", "1", "2", "1")
      expected = %q{
=====================
TYPE A COMMAND NUMBER
=====================
1. Register a Move
}
      expect(output).to include(expected)
    end
  end
  context "when an incorrect command is typed" do
    it "prints an error message" do
      output = run_plt_with_input("2", "1", "2", "add")
      expect(output).to include("That is not a valid display number")
    end
  end
end