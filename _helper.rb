Point2D = Struct.new(:x, :y)

File.readlines("../x360_points.txt").each do |line|
  line = line.strip
  next if line.empty?

  point = line.split(",").map { |f| f.to_f }

  puts "Point2D.new(#{point.first}, #{point.last}),"
end