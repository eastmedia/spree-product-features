Factory.define(:feature) do |f|
  f.name { Faker::Lorem.words(1).first }
end
