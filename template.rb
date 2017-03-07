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
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'

  gem 'cucumber-rails', require: false
  gem 'capybara'
  gem 'capybara-screenshot'

  # code coverage
  # needs to be configured https://github.com/colszowka/simplecov
  gem 'simplecov', require: false
  # https://github.com/fguillen/simplecov-rcov
  gem 'simplecov-rcov', require: false
end

gem_group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker', '>= 1.6.5'
  # checks Gemfile.lock for outdated and insecure gems
  gem 'bundler-audit', require: false

  # analyzes ruby code for structural similarities
  gem 'flay'

  # overwatch for clean code
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'scss_lint', require: false
  gem 'haml_lint', require: false
end

gem_group :development do
  # checks security of the application
  gem 'brakeman', require: false
  
  # nice looking debug error page (runs better along with binding_of_caller)
  gem 'better_errors'
  gem 'binding_of_caller'

  # helps reducing number of queries
  # needs to be cofigured https://github.com/flyerhzm/bullet
  gem 'bullet'
  gem 'ruby-growl'

  # removes unneccessary spacings in data schema
  gem 'activerecord_sane_schema_dumper'
end

environment nil, env: 'development' do
<<-BULLET
config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.growl = true
    # Bullet.xmpp = { account: 'bullets_account@jabber.org',
    #                 password: 'bullets_password_for_jabber',
    #                 receiver: 'your_account@jabber.org',
    #                 show_online_status: true }
    Bullet.rails_logger = true
    Bullet.honeybadger = true
    Bullet.bugsnag = true
    Bullet.airbrake = true
    Bullet.rollbar = true
    Bullet.add_footer = true
    # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
    # Bullet.stacktrace_excludes = [ 'their_gem', 'their_middleware' ]
    # Bullet.slack = { webhook_url: 'http://some.slack.url', channel: '#default', username: 'notifier' }
   
    # Each of these settings defaults to true

    # Detect N+1 queries
    # Bullet.n_plus_one_query_enable     = false

    # Detect eager-loaded associations which are not used
    # Bullet.unused_eager_loading_enable = false

    # Detect unnecessary COUNT queries which could be avoided
    # with a counter_cache
    # Bullet.counter_cache_enable        = false
  end
BULLET
end

after_bundle do
  generate 'rspec:install'

  git :init
  git add: '.'
  git commit: '-am "Initial commit: clean Rails application"'
end
