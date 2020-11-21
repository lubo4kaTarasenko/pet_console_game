require 'yaml'

class User
  
  attr_accessor :login, :password

  def initialize(login, password)
    @login = login
    @password = password
  end

  def commands
     %w[feed play water toilet sleep status voice love observe exit]
  end

  def save
    user = {
      login: @login,
      passwors: @password,
      role: self.class.to_s
    }
    File.open('./database/users.yml', 'a') { |file| file.puts(user.to_yaml) }
  end


end