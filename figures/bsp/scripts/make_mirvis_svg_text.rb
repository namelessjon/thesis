#!/usr/bin/ruby
# make_mirvis_svg.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>

IMG_HEIGHT = 60.236
X = 1
Y_OFFSET = 16.362183

def text_string(x, y, id, text)
format = <<-eos
  <text
       xml:space="preserve"
       style="font-size:20px;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;fill:#000000;fill-opacity:1;stroke:none;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1;font-family:Sans;-inkscape-font-specification:Sans"
       x="%f"
       y="%f"
       id="%s"><tspan
         sodipodi:role="line"
         id="tspan2408"
         x="%f"
         y="%f"
         style="font-size:20px">%s</tspan></text>
eos
  format % [x, y, id, x, y, text]
end

[4, 16, 24, 36, 48, 68, 80, 90, 110, 128].each_with_index do |plot, i|
  text = '%d ms' % plot
  y  = (IMG_HEIGHT * i) + Y_OFFSET
  id = "label_%04d" % (plot)
  puts text_string(X, y, id, text)
end
