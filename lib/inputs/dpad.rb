module GamepadTester
  class DPad < Input
    def draw
      up_color, down_color, left_color, right_color = @color, @color, @color, @color

      up_color    = @active_color if Gosu.button_down?(Gosu.const_get("GP_#{@gamepad.id}_DPAD_UP"))
      down_color  = @active_color if Gosu.button_down?(Gosu.const_get("GP_#{@gamepad.id}_DPAD_DOWN"))
      left_color  = @active_color if Gosu.button_down?(Gosu.const_get("GP_#{@gamepad.id}_DPAD_LEFT"))
      right_color = @active_color if Gosu.button_down?(Gosu.const_get("GP_#{@gamepad.id}_DPAD_RIGHT"))

      # UP
      Gosu.draw_rect(@x - @height / 2, @y - (@width + @width / 2), @height, @width, up_color)
      # DOWN
      Gosu.draw_rect(@x - @height / 2, @y + (@width / 2), @height, @width, down_color)
      # LEFT
      Gosu.draw_rect(@x - (@width + @width / 2), @y - @height / 2, @width, @height, left_color)
      # RIGHT
      Gosu.draw_rect(@x + (@width / 2), @y - @height / 2, @width, @height, right_color)

      # DEBUG DOT
      # Gosu.draw_rect(@x - 0.25 / 2, @y - 0.25 / 2, 0.25, 0.25, Gosu::Color::RED)
    end
  end
end