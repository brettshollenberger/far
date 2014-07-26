module Differ
  class << self
    def format_for(f)
      Kernel.send :const_get, "Differ::Format::#{f.to_s.capitalize}"
    end
  end

  class Diff
    def format_as(f)
      f = Differ.format_for(f)
      @raw.inject("") do |sum, part|
        part = case part
          when String then "" 
          when Change then f.format(part)
        end
        sum << part
      end
    end
  end

  module Format
    module Plain
      class << self
        def format(change)
          (change.change? && as_change(change)) ||
          (change.delete? && as_delete(change)) ||
          (change.insert? && as_insert(change)) ||
          ''
        end

      private
        def as_insert(change)
          "#{change.insert}"
        end

        def as_delete(change)
          "#{change.delete}"
        end

        def as_change(change)
          "#{as_delete(change)}\n#{as_insert(change)}\n"
        end
      end
    end
  end
end
