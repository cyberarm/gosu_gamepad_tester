module GamepadTester
  class Trigger < Input
    def setup
      @border = [
        Gamepad::Point2D.new(0, 0),
        Gamepad::Point2D.new(@width, 0),
        Gamepad::Point2D.new(@width, @height),
        Gamepad::Point2D.new(0, @height),
        Gamepad::Point2D.new(0, 0),
      ]
    end

    def draw
      ratio = Gosu.axis(Gosu.const_get("GP_#{@gamepad.id}_#{@button_id.upcase}_TRIGGER_AXIS"))
      # TODO: FIXME: Gosu gamepad constants seem screwed up...
      ratio = Gosu.axis(Gosu.const_get("GP_#{@button_id.upcase}_TRIGGER_AXIS"))

      Gosu.translate(@x, @y) do
        Gosu.draw_rect(0, @height - @height * ratio, @width, @height * ratio, @color)
        Gosu.draw_path(@border)
      end
    end
  end
end