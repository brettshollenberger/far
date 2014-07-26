module Far
  class File
    attr_accessor :name, :colorized_name, :changes, :find, :parts, :original_version, :changed_version

    def initialize(name, find)
      @name  = name
      @parts ||= `ack #{find} #{name} /dev/null`.split("\n")
    end

    def colorized_name
      @colorized_name ||= @parts[0]
    end

    def changes
      @changes ||= @parts[1..-1].map do |change|
        parts       = change.split(/\:/)
        line_number = parts[0]
        replacement = parts[1..-1].join(":")
        {line_number: line_number, original: replacement}
      end
    end

  private
    def parts
      @parts ||= `#{lines_to_change_cmd}`.split("\n")
    end
  end
end
