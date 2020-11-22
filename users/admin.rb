class Admin < User
  def initialize
  end

  def commands
    super + %w[change_type change_name]
  end

end