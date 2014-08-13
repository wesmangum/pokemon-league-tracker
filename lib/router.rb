class Router
  def self.main_menu
    puts '====================='
    puts 'TYPE A COMMAND NUMBER'
    puts '====================='
    puts '1. Add Trainer'
    puts '2. View Trainer Profile'
    # puts '3. Record Battle'
    command = clean_gets

    case command
    when '1'
      TrainersController.add
    when '2'
      TrainersController.view
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.pokemon_menu(pokemon)
    puts '====================='
    puts 'TYPE A COMMAND NUMBER'
    puts '====================='
    puts '1. Register a Move'
    command = clean_gets

    case command
    when '1'
      PokemonController.add_move(pokemon)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.profile_menu(trainer)
    puts '====================='
    puts 'TYPE A COMMAND NUMBER'
    puts '====================='
    puts '1. Register a Pokemon'
    puts '2. View a Pokemon'
    command = clean_gets

    case command
    when '1'
      if PokemonController.check(trainer)
        PokemonController.add(trainer)
      else
        puts "You have registered 6 pokemon already"
      end
    when '2'
      PokemonController.view(trainer)
    else
      puts "I don't know the '#{command}' command."
    end
  end
end