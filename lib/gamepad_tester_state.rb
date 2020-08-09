module GamepadTester
  class GamepadTesterState
    PADDING = 10
    def initialize(window)
      @window = window

      @gamepads = []
    end

    def draw
      @gamepads.each(&:draw)
    end

    def update
      position_and_scale_gamepads
    end

    def gamepad_connected(gamepad_id)
      gamepad_name = Gosu.gamepad_name(gamepad_id).downcase
      p gamepad_name
      if gamepad_name.include?("ps4")
        @gamepads << PS4Controller.new(gamepad_id)
      elsif gamepad_name.include?("3360") or gamepad_name.include?("xinput")
        @gamepads << XBox360Controller.new(gamepad_id)
      else
        puts "Unknown gamepad: #{gamepad_name}, defaulting to NES Gamepad..."
        @gamepads << NESGamepad.new(gamepad_id)
      end
    end

    def gamepad_disconnected(gamepad_id)
      @gamepads.delete_if { |gp| gp.id == gamepad_id }
    end

    def position_and_scale_gamepads
      case @gamepads.size
      when 1
        gamepad = @gamepads.first
        gamepad.x, gamepad.y = PADDING, PADDING
        gamepad.scale = (@window.width - PADDING * 2) / gamepad.width
      when 2
        x = PADDING
        @gamepads.each do |gamepad|
          gamepad.x, gamepad.y = x, PADDING
          gamepad.scale = (@window.width / 2 - PADDING * 2) / gamepad.width

          x += (gamepad.scale * gamepad.width) + PADDING * 2
        end
      when 3, 4
        x = PADDING
        y = PADDING
        @gamepads.each do |gamepad|
          gamepad.x, gamepad.y = x, y
          gamepad.scale = (@window.width / 2 - PADDING * 2) / gamepad.width

          x += (gamepad.scale * gamepad.width) + PADDING * 2
          if x > @window.width
            x = PADDING
            y += PADDING + @window.height / 2 - PADDING
          end
        end
      end
    end
  end
end