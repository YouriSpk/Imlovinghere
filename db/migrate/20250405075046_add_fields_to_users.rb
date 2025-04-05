class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :role, :integer
    add_column :users, :bio, :text
    add_column :users, :avatar_url, :string
    add_column :users, :earnings, :decimal
    add_column :users, :time_spent, :integer
  end
end
