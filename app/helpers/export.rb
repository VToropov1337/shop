require 'rubyXL'

class Export

def initialize

end

def run

workbook = RubyXL::Workbook.new
worksheet = workbook.worksheets[0]

Item.all.each_with_index do |x,i|

  worksheet.add_cell(i, 0, x.name)
  worksheet.add_cell(i, 1, x.price)
end

file = File.new("test.xlsx", 'w')
workbook.write(file.path)
file.close
  end
end
