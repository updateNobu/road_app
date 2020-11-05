class AddDisplayToRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmaps, :display, :boolean, default: true
  end
end
