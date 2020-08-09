module GamepadTester
  class NESGamepad < Gamepad
    def setup
      @options[:name] = "NES Gamepad"

      @border = [
        Point2D.new(0, 0),
        Point2D.new(12.3, 0),
        Point2D.new(12.3, 5.3),
        Point2D.new(0, 5.3),
        Point2D.new(0, 0),
      ]

      @inputs = [
        DPad.new(self, nil, x: 2.0, y: 3.2, name: "D-Pad", width: 1.0, height: 0.8),

        # TODO: Use correct button const
        Button.new(self, "BUTTON_0", x: 5.2, y: 3.8, name: "Select", width: 1.0, height: 0.25),
        Button.new(self, "BUTTON_1", x: 6.4, y: 3.8, name: "Start", width: 1.0, height: 0.25),

        Button.new(self, "BUTTON_3", x: 8.4, y: 3.8, radius: 0.5, name: "B", hint: :round, color: Gosu::Color::RED),
        Button.new(self, "BUTTON_4", x: 10.4, y: 3.8, radius: 0.5, name: "A", hint: :round, color: Gosu::Color::RED),
      ]

      @label = Point2D.new(12.3 / 2, 5.3 / 2)
    end
  end
end