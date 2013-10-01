require 'time'
require 'chronic'
require 'csv'
require 'yaml'

class HoboParser
  attr_accessor :control_file, :cut_list

  def initialize(control='')
   @cut_list = YAML.load(File.read('./control.yaml'))
   @output = {}
  end

  def parse(file)
    internal = false
    lines = CSV.read(file, encoding: 'WINDOWS-1252:UTF-8')
    title = lines.shift
    lines.shift
    id = title[0].split()[2]

    lines.each do |row|
      sampled_at = Chronic.parse(row[1])
      list = @cut_list.first {|x| x[:id] == id }
      if sampled_at > list[:from] &&
        sampled_at < list[:to]
        unless @output["#{list[:id]}-#{sampled_at}"]
          @output["#{list[:id]}-#{sampled_at}"] = [list[:id],list[:plot],sampled_at]
        end
        if list[:internal]
          @output["#{list[:id]}-#{sampled_at}"][3] = row[2]
        else
          @output["#{list[:id]}-#{sampled_at}"][4] = row[2]
        end
        @output["#{list[:id]}-#{sampled_at}"][5] = row[3]
      end
    end
  end

  def write
    CSV do |csv|
      @output.each do |row|
        csv << row[1]
      end
    end
  end
end
