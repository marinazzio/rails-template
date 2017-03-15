# rails-template
Template for creating Ruby-on-Rails applications

## Running stack
[PostgreSQL](https://rubygems.org/gems/pg), [hamlit](https://rubygems.org/gems/hamlit-rails), [devise](https://github.com/plataformatec/devise) (optional)

## Developing stack
[bundler-audit](https://github.com/rubysec/bundler-audit#readme), [flay](http://ruby.sadi.st/Ruby_Sadist.html), [rubocop](https://github.com/bbatsov/rubocop), [haml-lint](https://github.com/brigade/haml-lint), [scss-lint](https://github.com/brigade/scss-lint), [bullet](https://github.com/flyerhzm/bullet), [brakeman](http://brakemanscanner.org/), [simplecov](https://github.com/colszowka/simplecov), [newrelic-rpm](https://github.com/newrelic/rpm)

## Testing stack
[spinach](https://github.com/codegram/spinach-rails), [capybara](https://github.com/teamcapybara/capybara) (with [capybara-screenshot](https://github.com/mattheworiordan/capybara-screenshot)), [rspec](https://github.com/rspec/rspec-rails) (with [factory_girl](https://github.com/thoughtbot/factory_girl_rails), [shoulda-matchers](https://rubygems.org/gems/shoulda-matchers) and [faker](https://github.com/stympy/faker))

## Usage
```console
$ rails new my_new_application -T -m https://raw.githubusercontent.com/marinazzio/rails-template/master/template.rb
```
