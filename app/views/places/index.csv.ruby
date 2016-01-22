require 'csv'

csv_data = CSV.generate( "", {:row_sep => "\r\n", :force_quotes => true} ) do |csv|
  csv << @places.column_names
  @places.each do |model|
    csv << model.attributes.values_at(*@places.column_names)
  end
end

csv_data.encode(Encoding::SJIS,:undef => :replace, :invalid => :replace)
