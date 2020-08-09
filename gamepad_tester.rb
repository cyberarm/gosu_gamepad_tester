begin
  require_relative "../ffi-gosu/lib/gosu"
rescue => LoadError
  require "gosu"
end
require "gosu_more_drawables"

require_relative "lib/window"
require_relative "lib/gamepad_tester_state"
require_relative "lib/gamepad"
require_relative "lib/gamepads/nes_gamepad"
require_relative "lib/gamepads/ps4_controller"
require_relative "lib/gamepads/xbox_360_controller"
require_relative "lib/input"
require_relative "lib/inputs/button"
require_relative "lib/inputs/joystick"
require_relative "lib/inputs/trigger"
require_relative "lib/inputs/dpad"

GamepadTester::Window.new.show