module Fit
  class Option
    attr_accessor :key, :value

    def initialize(key, value)
      @key   = key.to_s
      @value = value
    end

    def to_command_line
      "#{prefix}#{negator}#{@key.gsub(/\_/) { |k| "-" }}#{equals}#{@value unless boolean?}"
    end

    def flag?
      @key.length > 1
    end

    def switch?
      @key.length == 1
    end

    def negator
      "no-" unless @value
    end

    def equals
      "=" unless boolean?
    end

    def boolean?
      !!@value == @value
    end

    def prefix
      return "--" if flag?
      return "-"  if switch?
    end
  end
end
