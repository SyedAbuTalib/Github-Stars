# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'github'

get('/') do
  'Help me'
end

get('/:name') do
  g = GithubWrapper.new
  list = g.stars(params['name'])
  list.size
  "<h1>#{list.size}</h1>"
end
