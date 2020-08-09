module GamepadTester
  class Button < Input
    def draw
      if @options[:hint] == :round
        Gosu.draw_circle(@x, @y, @radius, 7, Gosu.button_down?(@button_id) ? @active_color : @color)
      else
        Gosu.draw_rect(@x - @width / 2, @y - @height / 2, @width, @height, Gosu.button_down?(@button_id) ? @active_color : @color)
      end
    end
  end
end