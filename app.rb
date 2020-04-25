# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors'
require 'octicons'
require 'language_colors'

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

  erb :masonry, locals: { list: @temp_var, 'username' => username }
end

get('/test') do
  @repo = Octicons::Octicon.new("repo")
  @dot = Octicons::Octicon.new('primitive-dot')
  @lc = LanguageColors::LanguageColors.new

  erb :card, locals: { repo: @repo.to_svg, dot: @dot.to_svg, lc: @lc }
end
