class Restaurant < ApplicationRecord
  validates_presence_of :name
  
  belongs_to :category

  has_many :comments
end
