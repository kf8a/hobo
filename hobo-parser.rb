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
    inside = false
    lines = CSV.read(file, encoding: 'WINDOWS-1252:UTF-8')
    lines.shift
    title = lines.shift
    id = title[2].match(/S\/N: (\d+)/)
    return unless id
    id = id[1].to_i

    chambers = @cut_list.first {|x| x[:id] == id }
    list = chambers[:chambers]
    p list
    lines.each do |row|
      sampled_at = Chronic.parse(row[1])
      list.each do |deployment|
        if sampled_at > deployment[:from] && sampled_at < deployment[:to]

          $stderr.print '.'

          unless @output["#{deployment[:id]}-#{sampled_at}"]
            @output["#{deployment[:id]}-#{sampled_at}"] = [deployment[:id],deployment[:plot],sampled_at]
          end

          if deployment[:inside]
            @output["#{deployment[:id]}-#{sampled_at}"][3] = row[2]
          else
            @output["#{deployment[:id]}-#{sampled_at}"][4] = row[2]
          end

          @output["#{deployment[:id]}-#{sampled_at}"][5] = row[3]
        end

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
