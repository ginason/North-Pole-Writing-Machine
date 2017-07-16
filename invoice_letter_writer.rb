require 'erb'

kids_data   = File.read('data/kids-data.txt')
invoice_letter = File.read('templates/invoice_sample_letter.txt.erb')

kids_data.each_line do |kid|
    kid_data_array = kid.split
    name     = kid_data_array[0]
    behavior = kid_data_array[2]
    toys     = kid_data_array[3..8]
    street_number = kid_data_array[9]
    street_name = kid_data_array[10]
    street_suffix = kid_data_array[11]
    postal_code = kid_data_array[12]
    house_value = kid_data_array[13].to_i

    total_toy = 0

    if house_value > 1000000
      toys.each do |toy|
      if toy == 'Kaleidoscope'
          toy_price = 0
          total_toy += toy_price
         else
          toy_price = 1000
          total_toy += toy_price
       end
      end
    elsif house_value >= 200000 && house_value <= 1000000
      toys.each do |toy|
        if toy == 'Kaleidoscope'
           toy_price = 0
           total_toy += toy_price
         else
           toy_price =100
           total_toy += toy_price
         end
      end
    elsif house_value < 200000
      toy_price = 0
      toys.each do |toy|
        toy_price = 0
      end
    end

      filename    = 'letters/invoices/' + name + '.txt'
      letter_text = ERB.new(invoice_letter, nil, '-').result(binding)

      puts "Writing #{filename}."
      File.write(filename, letter_text)
end

# toys.each do |toy|
#   if toy == 'Kaleidoscope'
#      toys.delete(toy)
#    end
# end
# random_toys = toys.sample
#
# toys.each do |toy|
#   if toy == random_toys
#      toys.delete(toy)
#    end
# end
#
#   # next unless behavior == 'invoice'
#

#
#
#
# end
#
puts 'Done!'
