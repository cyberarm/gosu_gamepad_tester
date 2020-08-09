module GamepadTester
  class Input
    attr_reader :button_id, :name, :x, :y, :radius
    def initialize(gamepad, button_id, options = {})
      default_options = { x: 0, y: 0, width: 1, height: 1, radius: 1, name: nil }

      options = default_options.merge(options)
      @options = options

      @button_id = button_id
      @button_id = Gosu.const_get("GP_#{gamepad.id}_#{button_id}") if button_id.is_a?(String)
      @gamepad = gamepad
      @name, @x, @y = options[:name], options[:x], options[:y]
      @width, @height = options[:width], options[:height]
      @radius = options[:radius]

      @color = options[:color] ? options[:color] : Gosu::Color::WHITE
      @active_color = options[:active_color] ? options[:active_color] : Gosu::Color::GRAY

      setup
    end

    def setup
    end
  end
end