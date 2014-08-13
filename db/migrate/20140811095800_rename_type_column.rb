class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :pokemons, :type, :pokemon_type
  end
end