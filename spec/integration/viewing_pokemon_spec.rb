RSpec.describe "Viewing a Pokemon", :integration do
  let!(:trainer){ Trainer.create(name: "Ash") }
  let!(:pokemon){ Pokemon.create(name: "Pikachu", trainer_id: "1", pokedex_id: "25", pokemon_type: "Electric") }
  context "valid input" do
    let!(:output){ run_plt_with_input("2", "1", "2", "1") }
    it "should display the Trainer's Pokemon" do
      expected = %q{
==========
PIKACHU
==========
Type: Electric
}
      expect(output).to include(expected)
    end
  end

  context "invalid input" do
    # let!(:output3){ run_plt_with_input("2", "1", "2", "3") }

    context "empty" do
      it "should print the error message" do
        output1 = run_plt_with_input("2", "1", "2", "")
        expect(output1).to include("That is not a valid display number")
      end
    end

    context "string" do
      it "should print the error message" do
        output2 = run_plt_with_input("2", "1", "2", "pikachu")
        expect(output2).to include("That is not a valid display number")
      end
    end

    context "pokemon doesn't exist" do
      it "should print the error message" do
        output3 = run_plt_with_input("2", "1", "2", "3")
        expect(output3).to include("That is not a valid display number")
      end
    end
  end
end