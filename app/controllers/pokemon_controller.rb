require 'net/http'

class PokemonController
  def self.add(trainer)
    puts "Type the National Pokedex ID of the Pokemon you wish to register"
    pid = clean_gets
    if pid.match(/^[0-9]+$/)
      pokemon = JSON.parse(Pokegem.get("pokemon", pid.to_i))
      name = pokemon["name"]
      pid = pokemon["national_id"]
      types = []
      pokemon["types"].each do |p|
        types << p["name"]
      end
      puts types
      pokemon = Pokemon.create(name: name, pokedex_id: pid, trainer_id: trainer.id, pokemon_type: types.join(" / "))
      puts "Congratulations! Your #{pokemon.name} has been registered."
      TrainersController.view(trainer.id.to_s)
    else
      puts "That ID is not valid"
    end
  end

  def self.add_move(pokemon)
    puts "Enter the the name of the move you wish to register"
    puts "Existing moves: #{pokemon.moves}"
    move = clean_gets
    if move.match(/^[a-zA-Z\-\s]+$/)
      pokemon_request = JSON.parse(Pokegem.get("pokemon", pokemon.pokedex_id.to_i))
      selected_move = pokemon_request["moves"].find{ |m| m["name"] == move.downcase.split(" ").join("-").capitalize }

      if selected_move.nil?
        puts "That move is not valid for this pokemon"
        exit
      end

      if pokemon.moves.include?(move)
        puts "This Pokemon already knows that move"
        exit
      end

      if pokemon.moves.split(" / ").size >= 4
        puts "You have registered 4 moves to this pokemon already"
        exit
      end

      if pokemon.moves.blank?
        pokemon.moves = move
      else
        pokemon.moves = pokemon.moves + " / #{move}"
      end
      pokemon.save
      puts "The move '#{move}' has been registered to #{pokemon.name}"
      puts "Updated moveset: #{pokemon.moves}"
    else
      puts "That move is not valid"
    end
  end

  def self.check(trainer)
    return trainer.pokemons.length < 6
  end

  def self.view(trainer)
    puts "Please select the display number of the Pokemon You wish to register"
    trainer.pokemons.each_with_index do |p, index|
      puts "#{index + 1}. #{p.name}"
    end

    number = clean_gets

    if number.match(/^[1-9]+$/) && number.to_i <= trainer.pokemons.length
      selected = trainer.pokemons[number.to_i - 1]
      puts "=========="
      puts "#{selected.name.upcase}"
      puts "=========="
      puts "Type: #{selected.pokemon_type}"
      puts "Moves: #{selected.moves}"

      Router.pokemon_menu(selected)
    else
      puts "That is not a valid display number"
    end
  end
end