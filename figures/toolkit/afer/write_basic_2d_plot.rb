#!/usr/bin/ruby
# write_basic_2d_plot.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>


# EXACT NUMBERS MIGHT NEED TWEAKING.  FIGURE WAS EDITTED AFTER BASIC GENERATION

# W = 53.149605
# H = 40.118111
W = 59
H = 46
START_X = 17
START_Y = 23
TYPES = %w{control bosch workman}



def write_image(time,het,type,x,y)
  name = "#{het}_#{type}"
  id = "#{name}_#{time}"
  path = "#{name}/#{id}.jpg"
text = <<-eos
    <image
       y="#{y}"
       x="#{x}"
       id="#{id}"
       height="42.793"
       width="56.693"
       sodipodi:absref="/home/jon/thesis/figures/toolkit/afer/04_plots/#{path}"
       xlink:href="04_plots/#{path}"
       style="font-size:18px" />
eos
end

def write_image_row(het,type,start_x,start_y)
  row = []
  4.times do |n|
    row << write_image(n+1,het,type,start_x+(n*W),start_y)
  end
  row.join("\n")
end

def write_image_set(het, start_x, start_y)
  set = []
  TYPES.each_with_index do |type,i|
    set << write_image_row(het,type,start_x, start_y+(i*H))
  end
  set.join("\n")
end




puts write_image_set('hom', START_X, START_Y)
# width of the hom set, plus a border.
puts write_image_set('het',(2*START_X) + (4*W),START_Y)




