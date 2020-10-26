class CreateRoadmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :roadmaps do |t|
      t.text :title
      t.integer :stady_time_week
      t.integer :stady_time_holiday
      t.integer :period_stady
      t.integer :total_stady_time
      t.text :total_comment
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
