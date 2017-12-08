class GithubService

attr_reader :conn

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{@user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_profile_info
    get_json("/users/#{@user.username}")
  end

  def get_repos_info
    get_json("/users/#{@user.username}/repos")
  end

  def get_starred_repo_info
    get_json("/users/#{@user.username}/starred")
  end

  def get_followers_info
    get_json("/users/#{@user.username}/followers")
  end

  def get_following_info
    get_json("/users/#{@user.username}/following")
  end

  def get_orgs_info
    get_json("/user/orgs")
  end

  def get_commit_shas_per_repo_branch_info(repo_name)
    response = get_json("/repos/#{@user.username}/#{repo_name}/branches")
    response.map {|branch| branch[:commit][:sha]}
  end

  def get_commits_per_branch_info(repo_name)
    all_commit_info = get_commit_shas_per_repo_branch_info.each do |sha|
      get_json("/repos/#{@user.username}/#{repo_name}/commits/#{sha}")
    end
    all_commit_info.each do |commit_info|
      Commit.new(commit_info)
    end
  end

  def get_recent_commits_per_branch_info(repo_name)
    get_commits_per_branch_info.find_all {|commit| (Date.today - 1.month).to_s < commit.date }
  end

private
  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


end
