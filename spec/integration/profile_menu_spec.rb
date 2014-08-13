RSpec.describe "Access the Profile Menu", :integration do
  let!(:trainer){ Trainer.create(name: "Ash") }
  context "prints the profile menu" do
    it "should display the profile command screen" do
      output = run_plt_with_input("2", "1")
      expected = %q{
=====================
TYPE A COMMAND NUMBER
=====================
1. Register a Pokemon
2. View a Pokemon
}
      expect(output).to include(expected)
    end
  end
  context "when an incorrect command is typed" do
    let!(:output){ run_plt_with_input("2", "1", "add") }
    it "prints an error message" do
      expect(output).to include("I don't know the 'add' command.")
    end
  end
end