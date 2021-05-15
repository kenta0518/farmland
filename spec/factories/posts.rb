FactoryBot.define do
  factory :post do
    p_name { "MyString" }
    p_introduction { "MyText" }
    p_price { 1 }
    p_adress { "MyString" }
    p_image { [Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg')] }
    p_menseki { 1.5 }
  end
end
