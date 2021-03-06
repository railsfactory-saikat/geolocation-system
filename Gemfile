# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 5.2.6", ">= 5.2.6.2"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "jwt"
gem "devise"
gem "figaro"
gem "interactor", "~> 3.0"
gem "bootsnap", ">= 1.1.0", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 3.7"
  gem "factory_bot_rails", "~> 6.1.0", require: false
  gem "faker", "~> 2.13.0", require: false
end

group :test do
  # Ensure a clean state for testing
  gem "database_cleaner", "~> 1.8.5"
  gem "shoulda-matchers", "~> 4.4.1"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
