class SetDefaultValueForMoves < ActiveRecord::Migration
  def change
    change_column :pokemons, :moves, :string, default: ""
  end
end