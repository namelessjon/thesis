# Rake Task File
# ecg.rake
# Jonathan D. Stott <jonathan.stott@gmail.com>
require File.join(File.dirname(__FILE__), 'gnuplot')

def ecg_plots(name)
  file "#{name}.eps" => ["#{name}.dat", PLOT_TEMPLATE] do |t|
    plot PLOT_TEMPLATE, :name => t.name.pathmap('%n')
  end

  CLEAN.include("#{name}.eps")

  file "#{name}.pdf" => "#{name}.eps" do |t|
    sh "epstopdf #{t.prerequisites}"
  end

  CLOBBER.include("#{name}.pdf")

  desc 'generate plots of the ecgs'
  task :ecgs => "#{name}.pdf"
end


def filter(input, output, frequency)
  rc = 1/(2*Math::PI*frequency)
  alpha = 0.001/(rc+0.001)
  previous = nil

  File.open(input) do |f|
    File.open(output, "w") do |o|
      f.each do |line|
        unless previous
          o.puts line
          previous = line.split.map { |n| n.to_f }
        else
          line_floats = line.split.map { |n| n.to_f }
          out_line = []
          out_line[0] = line_floats.first
          1.upto(12) do |n|
            out_line[n] = previous[n] + alpha*(line_floats[n] - previous[n])
          end
          o.puts out_line.join(" ")
          previous = out_line
        end
      end
    end
  end
end

def filtered_ecg(name, freq)
  file "#{name}_#{freq}Hz.dat" => "#{name}.dat" do |t|
    filter(t.prerequisites.first, t.name, freq)
  end
  CLEAN.include("#{name}_#{freq}Hz.dat")

  ecg_plots "#{name}_#{freq}Hz"
end
