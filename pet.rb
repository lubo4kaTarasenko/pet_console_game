class Pet 
  attr_accessor :name, :response, :states, :lifes

  def initialize(name)
    @name = name
    @feed_level = 3
    @water_level = 3
    @energy_level = 3
    @lifes = 3
    @mood = 'happy'
    @need_toilet = false
    @states = [@feed_level, @water_level, @energy_level]
    @response = []    
  end

  def feed
    if @feed_level < 3
      @feed_level = 3
      @response << 'omnomnom. thank u, dude'
      @mood = 'happy'
    else
      @response << 'feeeeeee. not hungry.'
    end
    check
  end
  
  def water
    if @water_level < 3
      @water_level = 3
      @response << 'bul-bul-hlyup-hlyup. thank u, dude'
      @mood = 'happy'
    else
      @response << 'feeeeeee. not thirsty.'
    end
    check
  end

  def go_sleep
    if @energy_level < 3
      @energy_level = 3
      @response << 'hhhhrrrrrptcchhhhhh'
    else
      @response << 'feeeeeee. don`t wanna sleep'
    end
    check
    lower_states
    @mood = 'good'
  end

  def toilet
    if @need_toilet
      @response << 'I`ve done it'
    else
      @response << 'feeeeeee. don`t need toilet'
    end
    @need_toilet = false
    lower_states
    check
  end

  def play
    @response << 'you`r playing with your pet'
    lower_states
    check
    @mood = 'happy'
  end

  def is_dead?
    @lifes == 0
  end

  private

  def hungry?
    @feed_level == 1
  end

  def thirsty?
    @water_level == 1
  end

  def sleepy?
    @energy_level == 1
  end

  def lower_states
    @feed_level -= 1
    @water_level -= 1
    @energy_level -= 1
  end

  def maybe_lose_life    
    if [@feed_level, @water_level, @energy_level].any?(&:zero?)
      @lifes -=1 
      @response << "I have just lost one of my lifes(( now I have #{@lifes} lifes"
      @feedlevel = 3
      @water_level = 3
      @energy_level = 3
    end
  end

  def check
    @response <<'I`m so  hungry!' if hungry?
    @response << 'I`m so thirsty!' if thirsty?
    @response << 'I need toilet!' if @need_toilet
    @response << 'I need to sleep!' if sleepy?
    maybe_lose_life  
    @response.each{ |r| puts r.red}
  end  
end
