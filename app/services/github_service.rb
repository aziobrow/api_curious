class GithubService

attr_reader :conn

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      if @user.oauth_token?
        faraday.headers["Authorization"] = "token #{@user.oauth_token}"
      end
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

  def get_commit_info_per_repo_info(repo_name)
    get_json("/repos/#{@user.username}/#{repo_name}/commits")
  end


private
  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end


end
