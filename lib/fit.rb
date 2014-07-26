#! /usr/bin/env ruby

require "pry"
require "optparse"
require "differ"

module Fit
  @options = {:run => false, :please => false}

  OptionParser.new do |opts|
    opts.on("-r", "--[no-]replace", "Replace. Not a dry run. Must be combined with --please") do |r|
      @options[:replace] = r
    end

    opts.on("-p", "--[no-]please", "Manners are important.") do |p|
      @options[:please] = p
    end

    opts.on("--ignore-dir", "Directory to ignore. Uses Ack options") do |d|
      @options[:ignore_dir] = d
    end

    opts.on("--ignore-file", "File(s) to ignore. Uses Ack options") do |d|
      @options[:ignore_file] = d
    end
  end
end


# module Differ
#   class << self
#     def format_for(f)
#       Kernel.send :const_get, "Differ::Format::#{f.to_s.capitalize}"
#     end
#   end

#   class Diff
#     def format_as(f)
#       f = Differ.format_for(f)
#       @raw.inject("") do |sum, part|
#         part = case part
#           when String then "" 
#           when Change then f.format(part)
#         end
#         sum << part
#       end
#     end
#   end

#   module Format
#     module Plain
#       class << self
#         def format(change)
#           (change.change? && as_change(change)) ||
#           (change.delete? && as_delete(change)) ||
#           (change.insert? && as_insert(change)) ||
#           ''
#         end

#       private
#         def as_insert(change)
#           "#{change.insert}"
#         end

#         def as_delete(change)
#           "#{change.delete}"
#         end

#         def as_change(change)
#           "#{as_delete(change)}\n#{as_insert(change)}"
#         end
#       end
#     end
#   end
# end

# substitution = ARGV[0]
# match        = ARGV[0].split('/')[1]
# replacement  = ARGV[0].split('/')[2]
# file_list    = `ack #{match} -l`.split(" ")

# def should_run?
#   @options[:run] && @options[:please]
# end

# def run
#   return "-i ''" if should_run?
#   return ""
# end

# def redirect
#   return "> ./fit.tmp" unless should_run?
#   return ""
# end

# def replaced_file(file)
#   return "./fit.tmp" unless should_run?
#   return file
# end

# def before_clause
#   return "Fit would replace:" unless should_run?
#   "Replaced:"
# end

# file_list.each do |file|
#   line_numbers = `ack #{match} #{file} /dev/null`
#                     .split("\n").map do |line|
#     line.gsub(/\:[\s\S]*$/) {|butt| ""}
#   end

#   line_numbers.shift

#   original = `cat #{file}`
#   `sed #{run} -e #{substitution} #{file} #{redirect}`
#   changed = `cat #{replaced_file(file)}`

#   diff = "#{Differ.diff_by_line(changed, original).format_as :plain}"

#   diff = diff.gsub!(Regexp.new(match)) do |change| 
#     "\033[31m#{change}\033[0m"
#   end

#   outputs = {}

#   diff.split("\n").each_with_index do |line, index|
#     key = line_numbers[index % line_numbers.length]

#     outputs[key] = [] unless outputs[key]
#     outputs[key].push(line)
#   end

#   puts "\033[32m#{file}\033[0m"
#   outputs.each do |line| 
#     puts line
#     puts
#   end

#   `rm fit.tmp 2> /dev/null`
# end
