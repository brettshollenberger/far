module Fit
  class ChangeReport
    attr_accessor :report

    def initialize(files)
      @files  = files
      @report = make
    end

    def make
      @files.inject({}) do |change_report, file|
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
