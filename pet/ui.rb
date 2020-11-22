require 'rubygems'
require 'bundler'
require_relative 'string_beauty'
require_relative 'pet'
require_relative 'dog'
require_relative 'cat'
require 'pet_html'
require_relative '../users/session'

class Ui
  def start
    init_user
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
        update_html
      when 'water'
        @pet.water       
        update_html
      when 'toilet'
        @pet.toilet
        update_html
      when 'sleep'
        @pet.go_sleep
        update_html
      when 'play'
        @pet.play
        update_html
      when 'status'
        p @pet
      when 'voice'
        @pet.voice
        update_html
      when 'love'
        @pet.love
        update_html
      when 'observe'
        @pet.random
        update_html
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

  def init_user
    puts 'Please, enter you`r login: '.pink
    login = gets.chomp.downcase
    puts 'Please, enter you`r password: '.pink
    password = gets.chomp.downcase
    @user = Session.new(login, password).log_in  
    init_user unless @user
  end

  def enter_command
    puts 'choose a command, please: '.green
    puts @user.commands.join(', ')    
    command = gets.strip.downcase
  end

  def update_html
    PetHtml.new(@pet).make_html
  end
end

Ui.new.start
