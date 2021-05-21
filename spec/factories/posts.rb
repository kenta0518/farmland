FactoryBot.define do
  factory :post do
    p_name { "MyString" }
    p_introduction { "MyText" }
    p_price { 1 }
    p_adress { "MyString" }
    p_menseki { 1.5 }
  end
end
