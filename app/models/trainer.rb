class Trainer < ActiveRecord::Base
  has_many :pokemons

  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_presence_of :name
  validates_length_of :name, maximum: 30, minimum: 3, message: "must be between 3 and 30 characters"
end