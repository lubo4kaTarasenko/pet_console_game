require 'rubygems'
require 'bundler'
Bundler.setup(:default, :ci)

require_relative 'string_beauty'
require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require 'pet_html'

class Ui
  COMMANDS = %w[feed play water toilet sleep status voice love observe exit].freeze
  def start
    init_pet
    html = PetHtml.new(@pet)
    html.open_html
    while true      
      if @pet.is_dead? 
        @pet.response << "i`m dying. i loved u. sorry. "
        @emoji = '&#128561;'
        break
      end   
      command = enter_command
      @pet.response = []
      case command
      when 'feed'
        @pet.feed
        PetHtml.new(@pet).make_html
      when 'water'
        @pet.water       
        PetHtml.new(@pet).make_html
      when 'toilet'
        @pet.toilet
        PetHtml.new(@pet).make_html
      when 'sleep'
        @pet.go_sleep
        PetHtml.new(@pet).make_html
      when 'play'
        @pet.play
        PetHtml.new(@pet).make_html
      when 'status'
        p @pet
      when 'voice'
        @pet.voice
        html.make_html
      when 'love'
        @pet.love
        html.make_html
      when 'observe'
        @pet.random
        PetHtml.new(@pet).make_html
      when 'exit'
        break
      else
        p "sorry, i don't know this command: #{command}"
      end 
    end
  end
  
  def init_pet
    puts 'Please, enter you`r pet`s name? '.yellow
    name = gets.chomp
    puts 'Choose cat or dog, please'.yellow
    type = gets.chomp.downcase
    if type == 'dog'
      @pet = Dog.new(name)
    elsif type == 'cat'
      @pet = Cat.new(name)
    else
      puts 'Don`t know this pet'
    end
    puts "Hi i'm your #{@pet.class}. My name is #{@pet.name}. And I love u :*".yellow
  end

  def enter_command
    puts 'choose a command, please: '.green
    puts COMMANDS.join(', ')    
    command = gets.strip.downcase
  end
end

Ui.new.start
