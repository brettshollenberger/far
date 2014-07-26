module Fit
  class File
    attr_accessor :name, :changes, :find, :parts

    def initialize(name, find)
      @parts ||= `ack #{find} #{name} /dev/null`.split("\n")
    end

    def name
      @name ||= @parts[0]
    end

    def changes
      @changes ||= @parts[1..-1].map do |change|
        parts       = change.split(/\:/)
        line_number = parts[0]
        replacement = parts[1..-1].join(":")
        [line_number, replacement]
      end
    end

  private
    def parts
      @parts ||= `#{lines_to_change_cmd}`.split("\n")
    end
  end
end
