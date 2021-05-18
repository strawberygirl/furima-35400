FactoryBot.define do
  factory :user do
    nickname                        { 'test123' }
    email                           { 'test123@gmail.com' }
    password                        { 'tes123' }
    password_confirmation           { password }
    family_name                     { 'てす' }
    first_name                      { 'と' }
    kana_family_name                { 'テス' }
    kana_first_name                 { 'ト' }
    birthday                        { '1999-9-19' }
  end
end
