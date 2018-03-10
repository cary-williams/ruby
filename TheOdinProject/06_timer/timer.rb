class Timer
  attr_accessor :seconds

  def initialize
		@seconds = 0
	end

  def time_string
    minutes = (@seconds /60)%60
    hours = @seconds/ 3600
    @seconds -= (hours * 3600)+ (minutes * 60)

    if minutes.to_s.length == 1
      minutes = '0' + minutes.to_s
    end

    if hours.to_s.length == 1
      hours = '0' + hours.to_s
    end

    if @seconds.to_s.length == 1
      @seconds = '0' + @seconds.to_s
    end

    time_string =  [hours, minutes, @seconds].join(':')
  end

end
