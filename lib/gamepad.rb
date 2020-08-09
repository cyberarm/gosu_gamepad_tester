module GamepadTester
  class Gamepad
    Point2D = Struct.new(:x, :y)
    FONT = Gosu::Font.new(12)

    attr_reader :id, :width, :height
    attr_accessor :x, :y, :scale
    def initialize(id, options = {})
      default_options = { x: 0, y: 0, name: nil, scale: 1 }

      @id = id
      @options = default_options.merge(options)

      setup

      @name = @options[:name]
      @x, @y = @options[:x], @options[:y]
      @scale = @options[:scale]

      calculate_diamentions
    end

    def setup
    end

    def draw
      Gosu.translate(@x, @y) do
        Gosu.scale(@scale) do
          Gosu.draw_path(@border)

          @inputs.each do |input|
            input.draw
          end
        end

        FONT.draw_text(
          @name,
          @label.x * @scale - FONT.text_width(@name) / 2,
          @label.y * @scale - FONT.height / 2,
          0,
          1,
          1,
          Gosu::Color::WHITE,
          :add
        )
      end
    end

    def calculate_diamentions
      min = Point2D.new( Float::INFINITY,  Float::INFINITY)
      max = Point2D.new(-Float::INFINITY, -Float::INFINITY)

      @border.each do |point|
        min.x = point.x if point.x < min.x
        min.y = point.y if point.y < min.y

        max.x = point.x if point.x > max.x
        max.y = point.y if point.y > max.y
      end

      @width = max.x - min.x
      @height = max.y - min.y
    end
  end
end