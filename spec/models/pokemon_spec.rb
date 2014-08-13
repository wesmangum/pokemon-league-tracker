RSpec.describe Pokemon do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:trainer_id) }
    it { should validate_presence_of(:pokedex_id) }
    it { should validate_presence_of(:pokemon_type) }
  end
end