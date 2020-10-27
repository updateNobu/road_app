class Roadmap < ApplicationRecord
  has_many :roadmapshows, dependent: :destroy
  
  validates :title, {presence: true, length: {maximum: 140}}
  validates :stady_time_week, {presence: true}
  validates :stady_time_holiday, {presence: true}
  validates :period_stady, {presence: true}
  validates :total_stady_time, {presence: true}
  validates :total_comment, {presence: true, length: {maximum: 140}}
  validates :category_id, {presence: true}
  
  
end
