class Admin < User

  def commands
    super + %w[change_type change_name]
  end

end