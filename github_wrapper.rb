# frozen_string_literal: true

require 'octokit'

# Fetches a user's starred repositories from the GitHub API via Octokit.
class GithubWrapper
  # Returns an array of [name, description, forks, stars, language, full_name]
  # for each repo the user has starred, or nil if the user does not exist.
  def goodies(username)
    client.starred(username).map do |repo|
      [repo.name, repo.description, repo.forks_count, repo.stargazers_count,
       repo.language, repo.full_name]
    end
  rescue Octokit::NotFound
    nil
  end

  private

  # Memoized Octokit client. Uses GITHUB_TOKEN when present to lift the API
  # rate limit from 60 to 5,000 requests/hour; falls back to unauthenticated.
  def client
    @client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN']).tap do |c|
      c.auto_paginate = true
    end
  end
end
