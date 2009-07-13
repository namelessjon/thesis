#!/usr/bin/ruby
# gnuplot.rb
# Jonathan D. Stott <jonathan.stott@gmail.com>
require 'rubygems'
require 'erubis'

def create_gnuplot_script(template_name, context)
  # first read our template
  template = File.read(template_name)

  # parse it
  eruby = Erubis::Eruby.new(template)

  # and generate it (cleaning up beginning of the line ws)
  eruby.evaluate(context).gsub(/^\s+/,'')
end

def gnuplot(plot)
  system("gnuplot << EOF\n#{plot}\n\nEOF\n")
end

def plot(template_name, context)
  template = create_gnuplot_script(template_name, context)
  puts template
  gnuplot(template)
end


