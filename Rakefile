require 'rubygems'
require 'rake/clean'

def figure_prereqs(tex_files)
  figures = []
  # get a list of our tex files and grep them for include graphics lines.
  FileList[tex_files].egrep(/^[^%]*\\includegraphics\{[^}]+\}/) do |fn, c, l|
    if l =~ /\\includegraphics\{([^}]+)\}/
      found_non_eps = false
      %w{png pdf tif}.each do |ext|
        if File.file?("#{$1}.#{ext}")
          figures << "#{$1}.#{ext}"
          found_non_eps = true
          break
        end
      end
      unless found_non_eps
        figures << "#{$1}.pdf" if File.file?("#{$1}.eps")
      end
    end
  end

  figures
end

# set up some constants to say where things are

# name of the paper to build
PAPER = "thesis"
PDF = "#{PAPER}.pdf"

# location of the bibliography file
BIBLIOGRAPHY = "refs.bib"

# sources for project code
SRCDIR = "src"

# place to put objects
OBJDIR = "obj"

# place to put executables
BINDIR = "bin"

# place to store plot files
PLOTDIR = "plots"

# place to make figures
FIGDIR = "figures"


task :default => :paper

desc "Construct the paper"
task :paper => PDF


file PDF => (FileList["#{PAPER}.tex", BIBLIOGRAPHY, "chapters/**/*.tex"] + figure_prereqs("chapters/**/*.tex")) do
  Task[:clean].invoke
  sh "pdflatex #{PAPER}"
  sh "bibtex #{PAPER}"
  sh "pdflatex #{PAPER}"
  sh "pdflatex #{PAPER}"
end

# clean up common latex gunk
%w{aux log bbl blg ps dvi toc lof}.each do |ext|
  CLEAN.include("#{PAPER}.#{ext}")
end
CLEAN.include(FileList["chapters/*.tex"].pathmap('%X.aux'))

CLOBBER.include(PDF)

# make tasks to make all our directories
[SRCDIR, OBJDIR, BINDIR, PLOTDIR].each do |dir|
  directory dir
end

rule '.pdf' => ['.eps'] do |t|
  sh "epstopdf #{t.source} -o=#{t.name}"
end


# example numbers.tex script
# file "numbers.tex" => ["apd.dat", "plateau.dat"] do |t|
#   File.open(t.name, "w") do |out|
#     # for each of the prerequisites
#     t.prerequisites.each do |p|
#       # open them
#       File.open(p) do |i|
#         # figure out the name from the file name
#         name = p.sub(/\.dat/, '')
#         # write the figure into the figures file
#         out.puts new_command_line(name, i.read.chomp)
#       end
#     end
#   end
# end

task :contents => 'contents.html'

CLEAN.include('contents.html')

file 'contents.html' => 'README.md' do |t|
  require 'rdiscount'
  File.open(t.name, 'w') do |f|
    f.puts '<html>'
    f.puts '<head><title>J Stott Thesis Contents</title></head>'
    f.puts '<body>'
    f.puts RDiscount.new(File.open(t.prerequisites.first) {|i| i.read}).to_html
    f.puts '</body>'
    f.puts '</html>'
  end
end

task :count do
  count = `find . -name '*.tex' | xargs TeXcount.pl -brief`
  if count =~ /(\d+)\+(\d+)\+(\d+) \([^)]+\) TOTAL COUNT/
    puts "Words in text:     #{$1}"
    puts "Words in headers:  #{$2}"
    puts "Words in captions: #{$3}"
    puts "Total:             #{$1.to_i + $2.to_i + $3.to_i}"
    require 'rest_client'
    require 'system_timer'
    SystemTimer.timeout(30) do
      RestClient.post "http://rifgraf.heroku.com/graphs/nameless_thesis",
        :value => "#{$1.to_i + $2.to_i + $3.to_i}", :timestamp => Time.now
    end
  end
end
