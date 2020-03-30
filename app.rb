# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

require_relative 'github_wrapper'

get('/') do
  erb :index
end

post('/') do
  username = params[:username] || 'alipervaiz'
  g = GithubWrapper.new
  list = g.stars(username)
  @temp_var = list
  # puts Gem.loaded_specs.values.map(&:full_gem_path)

  erb :test, locals: { list: @temp_var, 'username' => username }
end
