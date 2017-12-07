class GithubUser

  def initialize(user)
    @user = user
  end

  def image_url
    github.get_profile_info[:avatar_url]
  end

  def repos
    github.get_repos_info.map do |raw_repos_info|
      Repository.new(raw_repos_info)
    end
  end

  def starred_repos
      github.get_starred_repo_info.map do |raw_repo_info|
      Repository.new(raw_repo_info)
    end
  end

  def followers
      github.get_followers_info.map do |raw_follower_info|
      GithubUser.new(raw_follower_info)
    end
  end

  def following
    github.get_following_info.map do |raw_following_info|
      GithubUser.new(raw_following_info)
    end
  end

  def organizations
    github.get_orgs_info.map do |raw_orgs_info|
      Organization.new(raw_orgs_info)
    end
  end

private
  attr_reader :user

  def github
    @github ||= GithubService.new(user)
  end

  # def image_url
  #   @raw_profile_data ||= GithubService.new(user).get_profile_info
  # end


end
