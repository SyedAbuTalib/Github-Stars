# frozen_string_literal: true

require 'github_api'

# This class will hold the stars function
class GithubWrapper
  def stars(username)
    gh = Github.new auto_pagination: true
    list = gh.activity.starring.starred user: username

    # list.each do |i|
    #   puts i.full_name
    # end

    list.size
  end
end
