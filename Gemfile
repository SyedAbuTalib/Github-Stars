# frozen_string_literal: true

# Gemfile

source 'https://rubygems.org'

# Heroku reads the Ruby version from Gemfile.lock's RUBY VERSION (written by
# this directive), NOT from .ruby-version. Constraint kept loose so local 4.0.6
# works; the lock pins the exact version Heroku installs (4.0.5, its newest).
ruby '~> 4.0'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'language_colors'
gem 'logger' # Ruby 4.0 removed logger from default gems; some deps still require it
gem 'octicons'
gem 'octokit'
gem 'puma'
gem 'sinatra'
gem 'sinatra-contrib'

gem 'rackup'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv'
end
