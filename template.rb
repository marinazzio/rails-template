# PostgreSQL by default
# v1.0.0 doesn't work with rails 5.1
gem 'pg', '< 1.0.0'

# templates with slim
gem 'slim-rails'

# optional Devise
if yes?('Would you like to install Devise?')
  gem 'devise'

  model_name = ask('What would you like the user model to be called? [user]')
  model_name = 'user' if model_name.blank?

  after_bundle do
    generate 'devise:install'
    generate 'devise', model_name
  end
end

gem_group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'shoulda-matchers'

  # code coverage
  # needs to be configured https://github.com/colszowka/simplecov
  gem 'simplecov', require: false
  # https://github.com/fguillen/simplecov-rcov
  gem 'simplecov-rcov', require: false
end

gem_group :development, :test do
  gem 'pry-byebug', platform: :mri
  gem 'pry-rails'

  gem 'rspec-rails'
  gem 'rails-controller-testing'

  gem 'factory_bot_rails'
  gem 'ffaker'
  # checks Gemfile.lock for outdated and insecure gems
  gem 'bundler-audit', require: false

  # analyzes ruby code for structural similarities
  gem 'flay'

  gem 'cucumber-rails'

  # overwatch for clean code
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'scss_lint', require: false
end

gem_group :development do
  # checks security of the application
  gem 'brakeman', require: false

  gem 'newrelic_rpm'

  # nice looking debug error page (runs better along with binding_of_caller)
  gem 'better_errors'
  gem 'binding_of_caller'

  # helps reducing number of queries
  # needs to be cofigured https://github.com/flyerhzm/bullet
  gem 'bullet'

  # removes unneccessary spacings in data schema
  gem 'activerecord_sane_schema_dumper'

  # watch files when they change and runs tests
  gem 'guard', require: false
  gem 'guard-rspec', require: false
end

environment nil, env: 'development' do
  open('https://raw.githubusercontent.com/marinazzio/rails-template/master/bullet_config.rb').read
end

after_bundle do
  run 'spring stop'
  generate 'rspec:install'
  generate 'cucumber'

  run 'guard init'
  run 'guard init rspec'

  run 'newrelic install --license_key="YOUR_KEY" "My application"'

  if yes?('Would you like to initialize git?')
    git :init
    git add: '.'
    git commit: '-am "Initial commit: clean Rails application"'
  end
end
