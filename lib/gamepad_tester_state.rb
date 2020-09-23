module GamepadTester
  class GamepadTesterState
    PADDING = 10
    def initialize(window)
      @window = window

      @gamepads = []
    end

    def draw
      @gamepads.each(&:draw)

      case @gamepads.size
      when 2
        Gosu.draw_line(
          @window.width / 2, 0, Gosu::Color::WHITE,
          @window.width / 2, @window.height, Gosu::Color::WHITE,
          0
        )
      when 3,4
        Gosu.draw_line(
          @window.width / 2, 0, Gosu::Color::WHITE,
          @window.width / 2, @window.height, Gosu::Color::WHITE,
          0
        )

        Gosu.draw_line(
          0, @window.height / 2, Gosu::Color::WHITE,
          @window.width, @window.height / 2, Gosu::Color::WHITE,
          0
        )
      end
    end

    def update
      position_and_scale_gamepads
    end

    def gamepad_connected(gamepad_id)
      gamepad_name = Gosu.gamepad_name(gamepad_id).downcase
      puts "#{gamepad_name} [#{gamepad_id}]"

      if gamepad_name.include?("ps4")
        @gamepads << PS4Controller.new(gamepad_id)
      elsif gamepad_name.include?("360") or gamepad_name.include?("xinput")
        @gamepads << XBox360Controller.new(gamepad_id)
      else
        puts "Unknown gamepad: #{gamepad_name}, defaulting to NES Gamepad..."
        @gamepads << NESGamepad.new(gamepad_id)
      end

      @gamepads.sort! { |gp| gp.id }
    end

    def gamepad_disconnected(gamepad_id)
      @gamepads.delete_if { |gp| gp.id == gamepad_id }
      @gamepads.sort! { |gp| gp.id }
    end

    def position_and_scale_gamepads
      case @gamepads.size
      when 1
        gamepad = @gamepads.first
        gamepad.x, gamepad.y = PADDING, PADDING
        gamepad.scale = gamepad_scale(gamepad, @window.width + PADDING * 2)
      when 2
        x = PADDING
        @gamepads.each do |gamepad|
          gamepad.x, gamepad.y = x, PADDING
          gamepad.scale = gamepad_scale(gamepad, @window.width + PADDING * 2)

          x += (gamepad.scale * gamepad.width) + PADDING * 2
        end
      when 3, 4
        x = PADDING
        y = PADDING
        @gamepads.each do |gamepad|
          gamepad.x, gamepad.y = x, y
          gamepad.scale = gamepad_scale(gamepad, @window.width + PADDING * 2)

          x += (gamepad.scale * gamepad.width) + PADDING * 2
          if x > @window.width
            x = PADDING
            y += PADDING + @window.height / 2 - PADDING
          end
        end
      end
    end

    def gamepad_scale(gamepad, max_size)
      scale = (@window.width / 2 - PADDING * 2) / gamepad.width

      return scale
    end
  end
end