class Cat < Pet
  RANDOM_PHRASES = [
    ['What the noice? Perhapse mouse. meow. i cauth you', 'you`r cat is running very fast all over the house'],
    ['let it be sleep. murrrrr', 'your cat is falling sleep'],
    ['ohhh what a nice new home sneakers', 'the cat sucked in you`r sneakers'] 
  ].freeze

  def initialize(name)
    super
    @lifes = 9
  end

  def play
    @response << 'you`re painting  with a laser on the wall'
    @response << 'meow , meow , i catch you. i`m a big terrible tiger'
    super
  end

  def voice
    @response << 'meow, meow, mrrrr'
    lower_states
    check
  end

  def love
    @response << 'your cat jump on your hands and need you pet it'
    @response << 'murrrr murrr, i love you'
    lower_states
    check
  end

  def toilet
    @response <<  'oh, you need clean the cat`s tray' if @need_toilet 
    super
  end

  def random
    @response <<  RANDOM_PHRASES.sample
    lower_states
    check
  end
end
