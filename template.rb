gem 'pg'
gem 'hamlit', '~> 2.8'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker', '>= 1.6.5'
  gem 'rails-controller-testing'
end

gem_group :test do
  gem 'shoulda-matchers'
end
