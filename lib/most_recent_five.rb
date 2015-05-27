class MostRecentFive
  require 'octokit'

  def initialize(username)
    @username = username
  end

  def call
    repos
  end

  def repos
    Octokit.repos(
      @username,
      type: "all",
      sort: "updated",
      per_page: "5"
    )
  end
end
