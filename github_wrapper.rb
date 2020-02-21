# frozen_string_literal: true

require 'github_api'

# This class will hold the stars function
class GithubWrapper
  def stars(username)
    gh = Github.new auto_pagination: true
    mashes = gh.activity.starring.starred user: username

    list = []
    mashes.each do |f|
      list << f.full_name
    end
    list
  end
end
