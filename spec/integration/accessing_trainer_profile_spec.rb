RSpec.describe "Accessing a Trainer's Profile", :integration do
  let!(:trainer){ Trainer.create(name: "Ash") }
  context "valid input" do
    let!(:output){ run_plt_with_input("2", trainer.id.to_s) }

    it "prints the trainer's profile" do
      expected = %q{
===============
TRAINER PROFILE
===============
Name: Ash
TID: 1
Pokemon:
No pokemon registered
}
      expect(output).to include(expected)
    end
  end
  context "invalid input" do
    let!(:output){ run_plt_with_input("2", "2") }

    it "prints an error message if Trainer ID doesn't exist" do
      expect(output).to include("Sorry, that Trainer does not exist in the system")
    end
  end
end