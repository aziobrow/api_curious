class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :user_id
      t.string :email
      t.string :name
      t.string :image_url
      t.string :profile_url
      t.string :username
      t.string :oauth_token
      t.string :followers_url
      t.string :following_url
      t.string :starred_url
      t.string :repo_url
      t.string :organizations_url

      t.timestamps
    end
  end
end
