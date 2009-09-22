Factory.define :user do |f|
  f.email { Faker::Internet.email }
  f.login { Faker::Name.first_name }
  f.password              "yourface"
  f.password_confirmation "yourface"
end
