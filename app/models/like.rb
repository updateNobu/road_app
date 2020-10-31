class Like < ApplicationRecord
  belongs_to :roadmaps, optional: true
  validates :user_id, {presence: true}
  validates :roadmap_id, {presence: true}
end
