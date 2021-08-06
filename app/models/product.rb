class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :made_in_usa, -> { where(country_of_origin: ["United States", 
    "USA", "America", "U.S.A."])}

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end