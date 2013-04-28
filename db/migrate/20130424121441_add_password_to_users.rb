class AddPasswordToUsers < ActiveRecord::Migration
 def self.up
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
    add_column :users, :access_token, :string
  end
  
  def self.down
    remove_column :users, :password
    remove_column :users, :password_confirmation
    remove_column :users, :access_token
    end
end
