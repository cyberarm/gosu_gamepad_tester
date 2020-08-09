File.readlines("../ds4_points.txt").each do |line|
  line = line.strip
  next if line.empty?

  point = line.split(",").map { |f| (f.to_f * 0.06274509803921569) + 1 }

  puts "Point2D.new(#{point.first}, #{point.last}),"
end