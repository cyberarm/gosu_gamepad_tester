module GamepadTester
  class XBox360Controller < Gamepad
    def setup
      @options[:name] = "XBOX 360 Controller"

      @border = []
      @inputs = []
    end
  end
end