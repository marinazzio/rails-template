# rails-template
Template for creating Ruby-on-Rails applications

## Running stack
[PostgreSQL](https://rubygems.org/gems/pg), [slim](http://slim-lang.com), [devise](https://github.com/plataformatec/devise) (optional)

## Developing stack
[bundler-audit](https://github.com/rubysec/bundler-audit#readme), [flay](http://ruby.sadi.st/Ruby_Sadist.html), [rubocop](https://github.com/bbatsov/rubocop), [slim-lint](https://github.com/sds/slim-lint), [scss-lint](https://github.com/brigade/scss-lint), [bullet](https://github.com/flyerhzm/bullet), [brakeman](http://brakemanscanner.org/), [simplecov](https://github.com/colszowka/simplecov), [newrelic-rpm](https://github.com/newrelic/rpm)

## Testing stack
[cucumber](https://github.com/cucumber/cucumber-rails), [capybara](https://github.com/teamcapybara/capybara) (with [capybara-screenshot](https://github.com/mattheworiordan/capybara-screenshot)), [rspec](https://github.com/rspec/rspec-rails) (with [factory_bot](https://github.com/thoughtbot/factory_bot_rails), [shoulda-matchers](https://rubygems.org/gems/shoulda-matchers) and [ffaker](https://github.com/ffaker/ffaker))

## Usage
```console
$ rails new my_new_application --skip-test \
  --template=https://raw.githubusercontent.com/marinazzio/rails-template/master/template.rb
```

Since `after_bundle` is deprecated it is required to run some initialization commands:

```console
  # with devise
  bundle exec rails generate devise:install
  # assuming User is the name of devise model
  bundle exec rails generate devise user

  bundle exec rails generate rspec:install
  bundle exec rails generate cucumber
  bundle exec guard init
  bundle exec guard init rspec

  # replace YOUR_KEY with your newrelic key
  bundle exec newrelic install --license_key="YOUR_KEY" "My application"
```
