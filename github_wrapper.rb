# frozen_string_literal: true

require 'github_api'

# This class will hold the stars function
class GithubWrapper
  def stars(username)
    gh = Github.new auto_pagination: true
    mashes = gh.activity.starring.starred user: username
    # logger(mashes.first)
    list = []
    mashes.each do |f|
      list << f.full_name
    end
    list
  end

  def goodies(username)
    gh = Github.new auto_pagination: true
    mashes = gh.activity.starring.starred user: username
    list = []
    mashes.each do |f|
      list << [f.name, f.description, f.forks_count, f.stargazers_count,
               f.language, f.full_name]
    end
    list
  end

  def logger(mash)
    puts "\n\nlogger has ran\n\n"
    File.open('mash.log', 'w') { |f| f.write mash.to_s }
  end
end
