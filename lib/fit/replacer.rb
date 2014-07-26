module Fit
  class Replacer
    attr_reader   :substitution
    attr_accessor :file_list, :options

    def initialize(substitution, options)
      self.substitution = substitution
      @options          = Options.new options
    end

    def substitution=(value)
      value += "/" unless value[-1] == "/"
      @substitution = value
    end

    def find
      @substitution.split('/')[1]
    end

    def replace
      @substitution.split('/')[2]
    end

    def file_list
      @file_list ||= `#{file_list_cmd}`.split(" ")
    end

    def dry_run?
      !@options[:please] || !@options[:replace]
    end

  private
    def file_list_cmd
      "ack #{find} -l #{options.to_command_line}"
    end
  end
end
