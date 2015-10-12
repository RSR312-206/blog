class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations
end
