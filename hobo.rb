require 'main'
require_relative 'hobo-parser'

Main {
  # argument 'control'

  def run
    parser = Parser.new(params['control'])
    Dir.glob('*.csv').each do |file|
      parser.parse(file)
    end
  end
}
