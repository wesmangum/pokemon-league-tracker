class AddMovesToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :moves, :string
  end
end