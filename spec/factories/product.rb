Factory.define(:product) do |f|
  f.description   { Faker::Lorem.sentence }
  f.name          { Faker::Lorem.sentence }
  f.accessory     false
  f.available_on  1.day.ago
  f.master_price  10.99
end
