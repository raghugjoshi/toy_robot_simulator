FactoryBot.define do
  factory :toy_robot do
    full_name { 'Tison' }
  end

  factory :table do
    width   { 5 }
    height  { 5 }
  end

  factory :document do
    name { Rack::Test::UploadedFile.new 'spec/fixtures/test_file.txt', 'text/plain' }
  end
end