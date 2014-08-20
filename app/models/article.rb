class Article < ActiveRecord::Base
  has_many  :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
  has_and_belongs_to_many :tags
  # validates :author, presence: true
end