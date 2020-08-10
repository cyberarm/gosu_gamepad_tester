module GamepadTester
  class Joystick < Input
    def draw
      x_axis = Gosu.axis(Gosu.const_get("GP_#{@gamepad.id}_#{@button_id.upcase}_STICK_X_AXIS"))
      y_axis = Gosu.axis(Gosu.const_get("GP_#{@gamepad.id}_#{@button_id.upcase}_STICK_Y_AXIS"))

      color = Gosu.button_down?(Gosu.const_get("GP_#{@gamepad.id}_#{@options[:button_id]}")) ? @active_color : @color

      Gosu.draw_arc(@x + (x_axis * (@radius / 2)), @y + (y_axis * (@radius / 2)), @radius, 1.0, 14, 0.1, color)
    end
  end
end