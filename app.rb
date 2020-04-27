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
  list = g.goodies(username)
  @list = list
  @repo = Octicons::Octicon.new('repo')
  @dot = Octicons::Octicon.new('primitive-dot')
  @star = Octicons::Octicon.new('star')
  @forked = Octicons::Octicon.new('repo-forked')
  @lc = LanguageColors::LanguageColors.new
  # puts Gem.loaded_specs.values.map(&:full_gem_path)

  erb :masonry, locals: { list: @list, 'username' => username,
                          repo: @repo.to_svg, dot: @dot.to_svg,
                          star: @star.to_svg, forked: @forked.to_svg, lc: @lc }
end
