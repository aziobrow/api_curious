class GithubUsersController < ApplicationController
  def show
    @github_user = GithubUser.new(current_user)
  end

  def orgs
    @orgs = GithubUser.new(current_user).organizations
  end
end
