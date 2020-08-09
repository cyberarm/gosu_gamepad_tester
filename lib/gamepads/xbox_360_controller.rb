module GamepadTester
  class XBox360Controller < Gamepad
    def setup
      @options[:name] = "XBOX 360 Controller"

      @border = [
        Point2D.new(52.911872799980166, 15.345833),
        Point2D.new(47.920193038047856, 15.345833),
        Point2D.new(43.1368315374298, 14.174239830085755),
        Point2D.new(38.550074178115835, 12.321674059875491),
        Point2D.new(33.5926555292139, 12.570065867696528),
        Point2D.new(28.981582363081923, 14.381056830887916),
        Point2D.new(25.58825277166461, 17.910277971084593),
        Point2D.new(23.6592333648672, 22.53992513066101),
        Point2D.new(22.104493919147004, 27.276982782985453),
        Point2D.new(20.8982202473486, 32.120809733784036),
        Point2D.new(19.848304985595696, 37.02041406817627),
        Point2D.new(19.02556936624121, 41.950752710214616),
        Point2D.new(18.785416999999995, 46.921238210246884),
        Point2D.new(18.785416999999995, 51.929026807316184),
        Point2D.new(20.124836005035394, 56.68456235998536),
        Point2D.new(23.798689077341077, 59.460345611509446),
        Point2D.new(28.622069745545982, 58.379362120984915),
        Point2D.new(32.78695084190166, 55.660358487999794),
        Point2D.new(36.54221494482422, 52.36372784863281),
        Point2D.new(40.66469228863716, 49.58612435761725),
        Point2D.new(45.35061374274922, 47.881949856971744),
        Point2D.new(50.33599315637779, 47.624999),
        Point2D.new(55.33963042179179, 47.624999),
        Point2D.new(60.33498160096538, 47.8713970701685),
        Point2D.new(65.03266838236809, 49.52431826925265),
        Point2D.new(69.17858152637481, 52.273697842605586),
        Point2D.new(72.92730094402789, 55.568756787531846),
        Point2D.new(77.07489119378792, 58.31737435761726),
        Point2D.new(81.89370918749998, 59.447533285156254),
        Point2D.new(85.63744984550428, 56.79620938623237),
        Point2D.new(87.047917, 52.06733254075969),
        Point2D.new(87.04791700000001, 47.076571570363626),
        Point2D.new(86.83119347939403, 42.0913256954763),
        Point2D.new(86.00795236836242, 37.15188214074708),
        Point2D.new(84.9662460038619, 32.26609356622947),
        Point2D.new(83.76553312336968, 27.405408431793937),
        Point2D.new(82.22738690269374, 22.66781218891908),
        Point2D.new(80.3035947505623, 18.050710442121513),
        Point2D.new(76.97717283612059, 14.454219183921822),
        Point2D.new(72.37541883831786, 12.603750959579479),
        Point2D.new(67.42224971523451, 12.307775039021502),
        Point2D.new(62.83488200658988, 14.112737829892167),
        Point2D.new(58.063259645768156, 15.345833000000006),
        Point2D.new(53.05482196662426, 15.345833000000002),
        Point2D.new(52.911872799980166, 15.345833),
      ]

      # Correct for error from SVG export
      x_error = @border.map { |pt| pt.x }.min
      y_error = @border.map { |pt| pt.y }.min
      ratio = 15.4 / @border.map { |pt| pt.y }.max # 15.4 CM width

      @border.each { |pt| pt.x -= x_error; raise "X: #{pt.x}" if pt.x < 0 }
      @border.each { |pt| pt.y -= y_error; raise "Y: #{pt.y}" if pt.y < 0 }
      @border.each { |pt| pt.x *= ratio; pt.y *= ratio }

      @inputs = [
        Joystick.new(self, :left, x: 3.0, y: 2.5, radius: 0.75),
        Joystick.new(self, :right, x: 11.5, y: 6.5, radius: 0.75),

        Trigger.new(self, :left, x: 7.0, y: 10, height: 2.0),
        Trigger.new(self, :right, x: 9.5, y: 10, height: 2.0),

        DPad.new(self, nil, x: 5.5, y: 6.5, name: "D-Pad", width: 1.0, height: 0.7),

        # Bumpers
        Button.new(self, 309, x: 4.5, y: 0.2, name: "Left Bumper", width: 2.0, height: 0.25),
        Button.new(self, 310, x: 13, y: 0.2, name: "Right Bumper", width: 2.0, height: 0.25),

        # NAMED
        Button.new(self, 304, x: 6.5, y: 2.5, name: "Share", hint: :round, radius: 0.375),
        Button.new(self, 305, x: 8.8, y: 2.5, name: "Guide", hint: :round, radius: 1.0),
        Button.new(self, 306, x: 11, y: 2.5, name: "Options", hint: :round, radius: 0.375),

        # The 4
        Button.new(self, 300, x: 14, y: 3.5, name: "A", hint: :round, radius: 0.5, color: 0xff6f8138),
        Button.new(self, 301, x: 15, y: 2.5, name: "B", hint: :round, radius: 0.5, color: 0xffcd2130),
        Button.new(self, 302, x: 13, y: 2.5, name: "X", hint: :round, radius: 0.5, color: 0xff0067ab),
        Button.new(self, 303, x: 14, y: 1.5, name: "Y", hint: :round, radius: 0.5, color: 0xffeaab37),
      ]

      @label = Point2D.new(8.8, 4.7)
    end
  end
end