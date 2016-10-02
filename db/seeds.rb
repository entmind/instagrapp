# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# dive09で生成、追記したよ。
100.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.last_name
  uid = Faker:: Number.number(10)
  provider = "twitter"
  User.create!(email: email,
    password: password,
    password_confirmation: password,
    name: name,
    uid: uid,
    provider: provider
    )
end

n = 1
pic_path = File.join(Rails.root, "app/assets/images/pic1.jpg")
while n <= 100
  Picture.create!(
    title: "あああ",
    user_id: n,
    pic: File.new(pic_path)
  )
  n = n + 1
end