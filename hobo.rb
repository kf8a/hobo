require 'main'
require_relative 'hobo-parser'

Main {
  description 'A program to collect logger data only for the times when the loggers were in use'

  option('control') {
    arity 1
    argument :optional
    description 'a control file specifying which times to save. Default "control.yaml"'
  }

  def run
    parser = HoboParser.new()
    Dir.glob('*.csv').each do |file|
      p file
      parser.parse(file)
    end
    parser.write
  end
}
