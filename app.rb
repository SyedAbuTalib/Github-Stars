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
  'Help me'
end

get('/test') do
  g = GithubWrapper.new
  list = g.stars('alipervaiz')
  @temp_var = list
  # puts list
  # @temp_var = nil
  erb :test, locals: { list: @temp_var }
end

get('/:name') do
  g = GithubWrapper.new
  list = g.stars(params['name'])
  list.size
  "<h1>#{list.size}</h1>"
end
