#!/usr/bin/ruby
# speed_up.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>

def speed_up(fraction, procs)
    1.0/((1 - fraction)+ (fraction/procs))
end


times = []
File.open("times.txt") do |f|
  f.each do |line|
    next if line =~ /^\s*$/
    procs, *t = line.split.map { |n| n.to_f }
    procs = procs.to_i - 1
    times[procs] = t
  end
end

n1 = (times[0].inject(0.0) { |total, time| total += time })/3

times.each_with_index do |t, i|
  procs = i + 1
  time = (t.inject(0.0) { |total, time| total += time })/3
  speed = n1/time
  puts "%2d %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f %6.2f" % [procs, speed, [0.95,0.96,0.97,0.98,0.99, 1.0].map {|f| speed_up(f, procs)}].flatten
end
