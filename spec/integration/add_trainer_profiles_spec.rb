RSpec.describe "Adding Trainer profiles", :integration do
  context "valid input" do
    let!(:output){ run_plt_with_input("1", "Ash") }

    it "should add a trainer" do
      expect(Trainer.count).to eq 1
    end
    it "should save the trainer's name accurately" do
      expect(Trainer.last.name).to eql "Ash"
    end
    it "should print a success message" do
      expect(output).to include("Ash's profile is ready to be edited!")
    end

    it "should print the Trainer's ID" do
      expect(output).to include("Trainer ID: 1")
    end
  end

  context "invalid input" do
    let(:long_string){ "foo" * 12 }
    let!(:output){ run_plt_with_input("1", long_string) }

    it "prints the error message for the invalid input" do
      expect(output).to include("Name must be between 3 and 30 characters")
    end
    it "shouldn't save the new record" do
      expect(Trainer.count).to eq 0
    end
  end
end

