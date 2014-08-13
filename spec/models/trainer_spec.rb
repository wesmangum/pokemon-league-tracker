RSpec.describe Trainer do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).
          is_at_least(3).
          is_at_most(30).
          with_message('must be between 3 and 30 characters') }

    context "validating format" do
      let!(:trainer){ Trainer.create(name: "12") }

      it "should have an appropriate error message" do
        expect(trainer.errors.full_messages_for(:name)
          ).to include("Name must include letters")
      end
      it "shouldn't save the new record" do
        expect(Trainer.count).to eq 0
      end
    end
  end
end