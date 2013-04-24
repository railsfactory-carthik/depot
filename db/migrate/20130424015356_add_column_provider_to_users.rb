class AddColumnProviderToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :provider, :string
    add_column :users, :email, :string
  end
  
  def self.down
    remove_column :users, :uid
    remove_column :users, :token
    remove_column :users, :provider
    remove_column :users, :email
    end
end
