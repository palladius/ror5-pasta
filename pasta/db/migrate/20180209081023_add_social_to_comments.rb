class AddSocialToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :facebook_id, :string
    add_column :comments, :twitter_id, :string
  end
end
