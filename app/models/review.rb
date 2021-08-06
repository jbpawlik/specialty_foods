class Review < ApplicationRecord
  belongs_to :product
  
  validates :author, presence: true
  validates :content_body, presence: true, length: { minimum: 50, maximum: 250}
  validates :rating, presence: true
  validates_numericality_of :rating, less_than: 6, greater_than: 0

  before_save(:titleize_review)


  private
  def titleize_review
    self.author = self.author.titleize
  end
end