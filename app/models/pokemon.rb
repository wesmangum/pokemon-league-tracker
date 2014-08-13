class Pokemon < ActiveRecord::Base
  belongs_to :trainer

  validates_presence_of :name, :trainer_id, :pokedex_id, :pokemon_type
end