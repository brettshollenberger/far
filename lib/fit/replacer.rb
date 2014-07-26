module Fit
  class Replacer
    attr_accessor :substitution

    def initialize(substitution)
      @substitution = substitution
    end

    def find
      @substitution.split('/')[1]
    end
  end
end
