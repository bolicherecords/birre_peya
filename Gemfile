PEYA_SDK_URL = 'https://integration_papa_jhons:eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJRY0ZYNGRBRXZwTWo5OWFETW1icWhaVzQxVWVyMWw1SVZxNHpvbVU0NnR3In0.eyJzdWIiOiJqZnJ0QDAxZDNldnlleWF6M3NuMDBrcmFnazUxOTFyXC91c2Vyc1wvaW50ZWdyYXRpb25fcGFwYV9qaG9ucyIsInNjcCI6Im1lbWJlci1vZi1ncm91cHM6ZXh0ZXJuYWwtcGFydG5lci1pbnRlZ3JhdGlvbnMtc2RrcyBhcGk6KiIsImF1ZCI6ImpmcnRAMDFkM2V2eWV5YXozc24wMGtyYWdrNTE5MXIiLCJpc3MiOiJqZnJ0QDAxZDNldnlleWF6M3NuMDBrcmFnazUxOTFyXC91c2Vyc1wvZW1pbGlhLmxhc2FnYSIsImV4cCI6MTYyOTc5OTY2MCwiaWF0IjoxNjE0MDE5NjYwLCJqdGkiOiJkNGQyMmM4ZS1hNWY3LTQyNDQtYjMzOC04ZWU3OGQxNTU4MjAifQ.KT7jJVnf8Q-mbM6blNXvzvbHAkai9YBvlmOijAVXB5Kaxke2rkOvT75f6bIZLfI0naDzDIDOCft9CpymsZHN3gCmOQ8PQg8Tybb8ME2hP06Z-MwIFpzcvi_wHLKZlnTkVccL_pU59DFk2STr-xa5cXAIyaaL_M4DA3EVhiv1wrx1UzcV5hdFsSiz6lifqwJwxxceaqsPg9LBmjNcV1C-fOeOmHeBsU9xvh6-ix9QPtc1ll7vODdi696XMjkPDGPRICbbMxPg_r2ZCGn7rh4Hw3SdCJ7HYLi69DlOQ5E-0bbu0kbujQ6zGJV5VLlWwICz1J0bPmyvN26756vkAvIrJA@pedidosya.jfrog.io/artifactory/api/gems/partner-integrations-gems-prod-local/'.freeze
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Sidekiq
gem 'sidekiq', '< 6'
gem 'sidekiq-failures'
gem 'sidekiq-scheduler', '~> 3.0'

# pedidosYa
source PEYA_SDK_URL do
  gem 'reception_sdk'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 11.0', platform: :mri
  # Loads ENV variables from .env file in base folder
  gem 'dotenv-rails', '~> 2.7'

  # Test
  gem 'factory_bot_rails', '~> 5.1'
  gem 'faker', '~> 2.6'

  # Lints
  gem 'rubocop', '~> 0.75'
  gem 'rubocop-rails', '~> 2.3'
  gem 'rubocop-rspec', '~> 1.36'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  #Unit test
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec-mocks', '~> 3.9'
  gem 'rspec-rails', '~> 3.9'
  gem 'shoulda-matchers', '~> 4.1'
end

group :development, :production do
  gem 'redis-rails', '~> 5.0'
end
