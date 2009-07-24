#!/usr/bin/ruby
# make_mirvis_svg.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>

HEIGHT = 60.236
WIDTH  = 265.74802

def image_string(x, y, id, height, width, file)
format = <<-eos
    <image
       x="%f"
       y="%f"
       id="%s"
       height="%f"
       width="%f"
       sodipodi:absref="/home/jon/thesis/figures/bsp/%s"
       xlink:href="%s"
       sodipodi:insensitive="true"
       />
eos
  format % [x, y, id, height, width, file, file]
end

[4, 16, 24, 36, 48, 68, 80, 90, 110, 128].each_with_index do |plot, i|
  # mine
  fn = 'flat/flat.%04d.png' % plot
  y  = HEIGHT * i
  x  = 0.0
  id = "mine_%04d" % (plot)
  puts image_string(x, y, id, HEIGHT, WIDTH, fn)

  # mirvis
  fn = 'flat_mirvis/mirvis_p_%04d.png' % plot
  y  = HEIGHT * i
  x  = WIDTH
  id = "mirvis_%04d" % (plot)
  puts image_string(x, y, id, HEIGHT, WIDTH, fn)

end
