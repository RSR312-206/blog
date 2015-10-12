class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations
  accepts_nested_attributes_for :associations
end
