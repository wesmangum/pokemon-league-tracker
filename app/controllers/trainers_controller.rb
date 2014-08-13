class TrainersController
  def self.add
    puts "What is the trainer's name?"
    name = clean_gets
    trainer = Trainer.create(name: name)
    if trainer.new_record?
      puts trainer.errors.full_messages
    else
      puts "#{name}'s profile is ready to be edited! Trainer ID: #{trainer.id}"
    end
  end

  def self.view(id=nil)
    if id == nil
      puts "Enter the ID of the Trainer you would like to update."
      tid = clean_gets
    else
      tid = id
    end
    trainer = Trainer.find_by id: tid.to_i
    if trainer.nil?
      puts "Sorry, that Trainer does not exist in the system"
      exit
    else
      puts "==============="
      puts "TRAINER PROFILE"
      puts "==============="
      puts "Name: #{trainer.name}"
      puts "TID: #{trainer.id.to_s}"
      puts "Pokemon:"
      if trainer.pokemons.length < 1
        puts "No pokemon registered"
      else
        trainer.pokemons.each_with_index do |p, index|
          puts "#{index + 1}. #{p.name}"
        end
      end
    end

    Router.profile_menu(trainer)
  end
end