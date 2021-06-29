require 'factory_bot'
require 'faker'
require 'dotenv'
Dotenv.load('.env')

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  

  Faker::Config.random = Random.new(config.seed)

  config.before(:all) do
    FactoryBot.reload
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
