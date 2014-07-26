module Fit
  class Options < Hash
    attr_accessor :options

    def self.fit_options
      [:replace, :no_replace, :please, :no_please]
    end

    def initialize(options={})
      options.each do |k, v|
        self[k.to_sym] = Option.new k, v
      end
    end

    def to_command_line
      self.reject do |k, v|
        v.fit_option?
      end.values.map(&:to_command_line).join(" ")
    end
  end
end
