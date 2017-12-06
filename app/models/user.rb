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
    end
  end
end
