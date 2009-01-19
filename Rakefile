require 'rubygems'
require 'rake/clean'

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

file PDF => FileList["#{PAPER}.tex", BIBLIOGRAPHY, "chapters/**/*.tex"] do
  Task[:clean].invoke
  sh "pdflatex #{PAPER}"
  sh "bibtex #{PAPER}"
  sh "pdflatex #{PAPER}"
  sh "pdflatex #{PAPER}"
end

# clean up common latex gunk
%w{aux log bbl blg}.each do |ext| 
  CLEAN.include("#{PAPER}.#{ext}")
end
CLEAN.include(FileList["chapters/*.tex"].pathmap('%X.aux'))

CLOBBER.include(PDF)

# make tasks to make all our directories
[SRCDIR, OBJDIR, BINDIR, PLOTDIR].each do |dir|
  directory dir
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

