#!/usr/bin/ruby
# frozen_string_literal: true

# Extracts a number of diferent archive methods
# without having to remember all of the commands
#
# Can be easily added to. just add a new rules.push line for new methods

rules = []
rules.push [:name, /(\.tar\.gz|\.tgz)$/, 'tar xzvf %FILE%']
rules.push [:name, /(\.tar\.bz2|\.tbz)$/, 'tar xjvf %FILE%']
rules.push [:name, /(\.tar\.lzo|\.tzo|\.tar\.lzop)$/, 'lzop -c -d %FILE% |tar -xv']
rules.push [:name, /(\.tar\.xz|\.txz)$/, 'tar xJvf %FILE%']
rules.push [:type, /tar archive/, 'tar -xvf %FILE%']
rules.push [:type, /^Zip archive/, 'unzip %FILE%']
rules.push [:type, / ZIP /, 'unzip %FILE%']
rules.push [:type, /^7-zip/, '7zr x %FILE%']
rules.push [:type, /^7-zip/, '7z x %FILE%']
rules.push [:type, /^7-zip/, '7za x %FILE%']
rules.push [:type, /^RAR archive/, 'unrar x -o+ -kb %FILE%']
rules.push [:type, /^RAR archive/, 'rar e -o+ -kb %FILE%']
rules.push [:type, /^Debian.*package/, 'dpkg -x %FILE% .']
rules.push [:type, /^Debian.*package/, 'ar -x %FILE%']
rules.push [:type, /^lzop /, 'lzop -x -f %FILE%']
rules.push [:name, /\.rz$/, 'rzip -d -k -v %FILE%']
rules.push [:type, /gzip /, 'gzip -d %FILE%'] # removes original file
rules.push [:type, /bzip2 /, 'bzip2 -dk %FILE%']
rules.push [:type, /^RPM/, 'rpm2cpio < %FILE% | cpio -i -m -d --verbose']
rules.push [:name, /(\.tar\.lzma|\.tlz)$/, 'lzma d -si -so < %FILE% |tar -xv']
rules.push [:name, /\.dar$/, 'dar -v -x %FILE%']
# wine and uharc.exe in path required
rules.push [:name, /\.uha$/, 'wine uharc x %FILE%']
rules.push [:type, /ZZip archive/, 'zzip x %FILE%']
rules.push [:type, /Zoo archive/, 'zoo -extract %FILE%']
rules.push [:type, /PowerISO/, 'poweriso extract %FILE% / -od .']
# if all previous type checks fail
rules.push [:name, /(\.zip|\.ZIP)$/, 'unzip %FILE%']
rules.push [:name, /\.nz$/, 'nz x %FILE%'] # NanoZip

# check arguments
if ARGV.empty?
  puts 'Usage:    extract archive [ archive archive ...]'
  exit 0
end

# collect all filenames that were not extractable
errors = []

# extract each archive
ARGV.each do |filename|
  # get filetype
  filename_with_comma = '"' + filename + '"'
  filetype = `file -b #{filename_with_comma}`

  # find command
  extraction_success = rules.find do |match_type, regexp, command|
    # find out if it is matching
    does_match = case match_type
                 when :name then regexp.match(filename)
                 when :type then regexp.match(filetype)
                 end

    # only return true if extraction was successful (to stop find)
    if does_match
      # matching rule found, try to extract
      executable = command.gsub('%FILE%', filename_with_comma)

      # returns true if execution was successful
      system(executable)
    else
      false
    end
  end

  # no extraction attempt completed successful, show error message
  errors.push filename_with_comma if extraction_success.nil?
end

# show error message
unless errors.empty?
  puts "\nERROR extraction not successful with these files:"
  errors.each do |filename|
    system("file #{filename}")
  end
  exit(1)
end
