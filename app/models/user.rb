class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    find_or_create_by(user_id: auth_info[:uid]) do |user|
      user.provider = auth_info[:provider]
      user.user_id = auth_info[:uid]
      user.email = auth_info[:info][:email]
      user.name = auth_info[:info][:name]
      user.image_url = auth_info[:info][:image]
      user.username = auth_info[:info][:nickname]
      user.profile_url = auth_info[:info][:urls][:GitHub]
      user.oauth_token = auth_info[:credentials][:token]
      user.followers_url = auth_info[:extra][:raw_info][:followers_url]
      user.following_url = auth_info[:extra][:raw_info][:following_url]
      user.starred_url = auth_info[:extra][:raw_info][:starred_url]
      user.repos = auth_info[:extra][:raw_info][:repos_url]
      user.organizations = auth_info[:extra][:raw_info][:organizations_url]
    end
  end
end

#can i hardcode endpoints once i know them? do i need to use auth info?
#e.g. starred https://api.github.com/users/aziobrow/starred
