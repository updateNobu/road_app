class AddHourColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmapshows, :hour_required, :integer, default: 0
  end
end
