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

      t.timestamps
    end
  end
end
