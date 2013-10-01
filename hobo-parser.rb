require 'time'
require 'csv'

class HoboParser
  attr_accessor :control_file, :cut_list

  def initialize(control='')
    self.control_file = control
  end

  def control_file=(control)
   cut_list = [
     {id: 1, plot: 'G1', from: Time.parse('2013-9-25 9:30'), to: Time.parse('2013-9-25 10:30')}
   ]
  end

  def parse(file)
    CSV.foreach(file) do |row|
      p row
    end
  end
end
