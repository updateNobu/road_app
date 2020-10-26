class CreateRoadmapshows < ActiveRecord::Migration[6.0]
  def change
    create_table :roadmapshows do |t|
      t.string :content
      t.string :method
      t.integer :time_required
      t.text :comment
      t.integer :roadmap_id

      t.timestamps
    end
  end
end
