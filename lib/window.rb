module GamepadTester
  class Window < Gosu::Window
    def initialize
      super(640, 480, false, resizable: true)

      self.caption = "Gosu Gamepad Tester"
      @state = GamepadTester::GamepadTesterState.new(self)
    end

    def draw
      @state.draw
    end

    def update
      @state.update
    end

    def button_down(id)
      super

      p id
    end

    def needs_cursor?; true; end

    def gamepad_connected(gamepad_id)
      @state.gamepad_connected(gamepad_id) if @state.respond_to?(:gamepad_connected)
    end

    def gamepad_disconnected(gamepad_id)
      @state.gamepad_disconnected(gamepad_id) if @state.respond_to?(:gamepad_disconnected)
    end
  end
end
