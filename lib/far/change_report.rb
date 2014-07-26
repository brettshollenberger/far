module Far
  class ChangeReport < Hash
    attr_accessor :report

    def initialize(files)
      files.each { |file| self[file.name] = file.changes }
    end

    def print
      each do |file, changes|
        changes.each do |change|
          puts "\033[32m#{file}\033[0m #{change[:line_number]}:"
          puts change[:original]
          puts change[:changed]
          puts
        end
      end
    end
  end
end
