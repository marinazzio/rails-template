# PostgreSQL by default
gem 'pg'
# light and fast haml parser
gem 'hamlit', '~> 2.8'

# optional Devise
if yes?("Would you like to install Devise?")
  gem "devise"
  generate "devise:install"
  model_name = ask("What would you like the user model to be called? [user]")
  model_name = "user" if model_name.blank?
  generate "devise", model_name
end

gem_group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'shoulda-matchers'

  # code coverage
  # needs to be configured https://github.com/colszowka/simplecov
  gem 'simplecov', require: false
  # https://github.com/fguillen/simplecov-rcov
  gem 'simplecov-rcov', require: false
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'

  gem 'factory_girl_rails'
  gem 'faker', '>= 1.6.5'
  # checks Gemfile.lock for outdated and insecure gems
  gem 'bundler-audit', require: false

  # analyzes ruby code for structural similarities
  gem 'flay'

  gem 'spinach-rails'
  gem 'spinach-rerun-reporter'
  gem 'spring-commands-spinach'

  # overwatch for clean code
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'scss_lint', require: false
  gem 'haml_lint', require: false
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
end

environment nil, env: 'development' do
  open('https://raw.githubusercontent.com/marinazzio/rails-template/master/bullet_config.rb').read
end

after_bundle do
  run 'spring stop'
  generate 'rspec:install'
  generate 'spinach'

  run 'newrelic install --license_key="YOUR_KEY" "My application"'

  git :init
  git add: '.'
  git commit: '-am "Initial commit: clean Rails application"'
end
