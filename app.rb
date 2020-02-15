# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'github_wrapper'

get('/') do
  'Help me'
end

get('/test') do
  @temp_var = "shalohm"
  erb :test, locals: { list: @temp_var }
end

get('/:name') do
  g = GithubWrapper.new
  list = g.stars(params['name'])
  list.size
  "<h1>#{list.size}</h1>"
end
