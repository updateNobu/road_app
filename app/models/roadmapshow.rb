class Roadmapshow < ApplicationRecord
  belongs_to :roadmaps, optional: true
  validates :content, {presence: true, length: {maximum: 140}}
  validates :method, {presence: true, length: {maximum: 140}}
  validates :time_required, {presence: true}
  validates :comment, {presence: true, length: {maximum: 140}}
  validates :roadmap_id, {presence: true}
end