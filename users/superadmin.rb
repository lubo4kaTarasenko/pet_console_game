class Superadmin < Admin

  def commands
    super + %w[kill reset change_owner_login change_life_state]
  end

end 