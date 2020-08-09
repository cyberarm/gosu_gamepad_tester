module GamepadTester
  class Joystick < Input
    def draw
      x_axis = Gosu.axis(Gosu.const_get("GP_#{@gamepad.id}_#{@button_id.upcase}_STICK_X_AXIS"))
      y_axis = Gosu.axis(Gosu.const_get("GP_#{@gamepad.id}_#{@button_id.upcase}_STICK_Y_AXIS"))

      # TODO: Remove when Gosu bug is fixed.
      x_axis = Gosu.axis(Gosu.const_get("GP_#{@button_id.upcase}_STICK_X_AXIS"))
      y_axis = Gosu.axis(Gosu.const_get("GP_#{@button_id.upcase}_STICK_Y_AXIS"))

      Gosu.draw_arc(@x + (x_axis * (@radius / 2)), @y + (y_axis * (@radius / 2)), @radius, 1.0, 14, 0.1)
    end
  end
end