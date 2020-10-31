class User < ApplicationRecord
  has_many :roadmaps, dependent: :destroy
  
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence:true}
  validates :password, {presence:true}
end
