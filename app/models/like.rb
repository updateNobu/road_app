class Like < ApplicationRecord
  belongs_to :roadmaps, optional: true
  belongs_to :user, optional: true
  validates :user_id, {presence: true}
  validates :roadmap_id, {presence: true}
end
