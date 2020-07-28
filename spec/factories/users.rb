FactoryBot.define do
  factory :user do
    name = Gimei.name
    nickname { name.first.hiragana }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password }
    password_confirmation { password }
    first_name { name.first.kanji }
    family_name { name.last.kanji }
    first_name_kana { name.first.katakana }
    family_name_kana { name.last.katakana }
    birthday { Faker::Date.birthday }
  end
end
