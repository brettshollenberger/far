module Fit
  class Replacer
    attr_reader   :substitution
    attr_accessor :file_list, :arguments

    def initialize(substitution, arguments="")
      self.substitution = substitution
      @arguments        = arguments
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

  private
    def file_list_cmd
      "ack #{find} -l #{@arguments}"
    end
  end
end
