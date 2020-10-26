class User < ApplicationRecord
  validates :email, {presence: true, uniqueness: true}
  validetas :name, {presence:ture}
end
