class User

  attr_accessor :login, password

  def initialize(login, password)
    @login = login
    @password = password
  end

  def commands
     %w[feed play water toilet sleep status voice love observe exit]
  end



end