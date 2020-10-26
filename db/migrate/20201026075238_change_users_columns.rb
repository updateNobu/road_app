class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :comment, :text
    add_column :users, :link, :string
    add_column :users, :mymap, :integer
  end
end
