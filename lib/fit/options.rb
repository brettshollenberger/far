module Fit
  class Options
    attr_accessor :options

    def initialize(options={})
      @options = options.hmap { |k, v| [k.to_sym, Option.new(k, v)] }
    end

    def to_command_line
      @options.inject("") do |cmd_line_args, option|
        cmd_line_args << "#{option[1].to_command_line} "
      end.strip
    end
  end
end

class Hash
  def hmap(&block)
    Hash[self.map {|k, v| block.call(k,v) }]
  end
end
