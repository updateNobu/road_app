class User < ApplicationRecord
  has_secure_password
  has_many :roadmaps, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :email, {presence: true, uniqueness: true}
  validates :name, {presence:true}
  validates :password, {presence:true}
end
