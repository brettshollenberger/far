module Fit
  class Replacer
    attr_reader :substitution

    def initialize(substitution)
      self.substitution = substitution
    end

    def substitution=(value)
      value += "/" unless value[-1] == "/"
      @substitution = value
    end

    def find
      @substitution.split('/')[1]
    end
  end
end
