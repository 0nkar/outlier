data = CSV.read('products.csv', headers: true)
seen = {}
result = data.select { |row| seen[row['product_id']] ? false : (seen[row['product_id']] = true) }
result.each do |row|
  row['price'] = sprintf('%.2f', row['price'].gsub(/[^\d.]/, '').strip.to_f)
  s = row['stock'].to_s.strip
  row['stock'] = s.match?(/^\d+$/) ? s.to_i : 0
  row['supplier_email'] = row['supplier_email'].to_s.downcase
end
CSV.open('processed_products.csv', 'w') do |csv|
  csv << data.headers
  result.each { |row| csv << row }
end
