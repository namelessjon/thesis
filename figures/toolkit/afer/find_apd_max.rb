#!/usr/bin/ruby
# find_apd_max.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>


last_di = nil
last_apd = nil

File.open("02_APDR/apd/s1s2_90_CRN98con.dat") do |f|
  f.each_line do |l|
    next if l =~ /^#/
    s2, s1apd, di, s2apd, vpeak, step, delta, ddt, ina_act = l.strip.split.map {|n| n.to_f }
    if last_di && last_apd
      di_diff = last_di - di
      apd_diff = last_apd - s2apd
      puts apd_diff/di_diff
    end
    last_di, last_apd = di, s2apd
  end
end
