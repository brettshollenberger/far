module Fit
  class Replacer
    attr_reader   :substitution
    attr_accessor :file_list, :options, :change_report

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

    def change_report
      @change_report ||= ChangeReport.new(file_list, find).report
    end

  private
    def file_list_cmd
      "ack #{find} -l #{@options.to_command_line}"
    end

    def lines_to_change_cmd(file)
      "ack #{find} #{file} /dev/null"
    end
  end
end
