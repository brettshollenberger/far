module Fit
  class ChangeReport
    attr_accessor :report

    def initialize(file_list, find)
      @file_list = file_list
      @find      = find
      @report    = make
    end

    def make
      @file_list.inject({}) do |change_report, file|
        file = File.new file, @find
        change_report[file.name] = file.changes
        change_report
      end
    end

  private
    def lines_to_change_cmd(file)
      "ack #{@find} #{@file} /dev/null"
    end
  end
end
