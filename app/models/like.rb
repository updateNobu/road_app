class Like < ApplicationRecord
  validates :user_id, {presence: true}
  validates :roadmap_id, {presence: true}
end
