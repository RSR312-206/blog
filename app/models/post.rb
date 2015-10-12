class Post < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :body, presence: true
  validates :author, presence: true

  has_many :associations, dependent: :destroy
  has_many :tags, through: :associations
  accepts_nested_attributes_for :tags
end
