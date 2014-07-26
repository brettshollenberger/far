module Fit
  class Replacer
    attr_reader   :substitution
    attr_accessor :file_list, :options, :change_report

    def initialize(substitution, options)
      self.substitution = substitution
      @options          = Options.new options
      generate_change_report
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

    def files
      file_list.map { |file| File.new file, find }
    end

    def in_place
      return "" if dry_run?
      return "-i ''"
    end

    def redirection
      "> #{tmp_file}" if dry_run?
    end

    def replaced_file(file)
      return tmp_file if dry_run?
      file
    end

    def run?
      !dry_run?
    end

    def dry_run?
      !@options[:please].value || !@options[:replace].value
    end

    def generate_change_report
      change_report
    end

    def change_report
      @change_report ||= ChangeReport.new(files)
    end

    def replace_file(file)
      original_version = `cat #{file.name}`
      `#{change_file_cmd(file)}`
      changed_version  = `cat #{replaced_file(file.name)}`

      return original_version, changed_version
    end

    def diff_file(file)
      original_version, changed_version = replace_file(file)
      Differ.diff_by_line(changed_version, original_version).format_as :plain
    end

    def diff
      files.each do |file|
        replacement_number = 0

        diff_file(file).lines.each_slice(2) do |slice|
          change_report[file.name][replacement_number][:changed] = slice[1]
          replacement_number += 1
        end
      end
    end

  private
    def file_list_cmd
      "ack #{find} -l #{@options.to_command_line}"
    end

    def lines_to_change_cmd(file)
      "ack #{find} #{file} /dev/null"
    end

    def change_file_cmd(file)
      "sed #{in_place} -e #{substitution} #{file.name} #{redirection}"
    end

    def tmp_file
      "./fit.tmp"
    end
  end
end
