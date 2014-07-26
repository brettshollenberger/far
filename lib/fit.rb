#! /usr/bin/env ruby

require "pry"
require "optparse"
require "differ"

require_relative "./fit/change_report"
require_relative "./fit/differ"
require_relative "./fit/file"
require_relative "./fit/option"
require_relative "./fit/options"
require_relative "./fit/replacer"

module Fit
  @options = {:replace => false, :please => false}

  OptionParser.new do |opts|
    opts.on("-r", "--[no-]replace", "Replace. Not a dry run. Must be combined with --please") do |r|
      @options[:replace] = r
    end

    opts.on("-p", "--[no-]please", "Manners are important.") do |p|
      @options[:please] = p
    end

    opts.on("--ignore-dir DIR", "Directory to ignore. Uses Ack options") do |dir|
      @options[:ignore_dir] = dir
    end

    opts.on("--ignore-file FILE", "File(s) to ignore. Uses Ack options") do |file|
      @options[:ignore_file] = file
    end
  end.parse!

  @replacer = Replacer.new(ARGV[0], @options)

  @replacer.diff
  @replacer.change_report.print

  `rm fit.tmp 2> /dev/null`
end
