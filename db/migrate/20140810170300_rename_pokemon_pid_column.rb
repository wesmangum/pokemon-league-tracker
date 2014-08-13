class RenamePokemonPidColumn <ActiveRecord::Migration
  def change
    rename_column :pokemons, :pid, :pokedex_id
  end
end