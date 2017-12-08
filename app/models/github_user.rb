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
      user = User.create(provider: 'github', user_id: raw_follower_info[:id], username: raw_follower_info[:login])
      GithubUser.new(user)
    end
  end

  def following
    github.get_following_info.map do |raw_following_info|
      user = User.create(provider: 'github', user_id: raw_following_info[:id], username: raw_following_info[:login])
      GithubUser.new(user)
    end
  end

  def organizations
    github.get_orgs_info.map do |raw_orgs_info|
      Organization.new(raw_orgs_info)
    end
  end

  def recent_repos
    repos.find_all {|repo| (Date.today - 1.month).to_s < repo.updated_at}
  end

  def all_commits_from_recent_repos
    commits = []
    recent_repos.each do |repo|
      commits << create_commits_per_repo(repo.name)
    end
    commits.flatten.compact
  end

  def create_commits_per_repo(repo_name)
    github.get_commit_info_per_repo_info(repo_name).map do |commit_info|
      if commit_info.class == Hash
        Commit.new(commit_info)
      end
    end
  end

  def recent_commits
    all_commits_from_recent_repos.find_all {|commit| (Date.today - 1.month).to_s < commit.date }
  end

private
  attr_reader :user

  def github
    @github ||= GithubService.new(user)
  end

end
