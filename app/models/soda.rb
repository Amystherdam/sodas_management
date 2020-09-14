class Soda < ApplicationRecord

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, stretches: 13

  validates_presence_of :brand, :category, :flavor, :capacity, :price, :quantiti
  validates_length_of :brand, maximum: 30, too_long: " - Enter a maximum of 30 characters."
  validates_numericality_of :capacity, :price, :quantiti
  validate :capacity_values
  validate :category_values
  validates :brand, uniqueness: {message: " - There is already the same capacity and flavor linked to this brand in the system!", if: [:capacity?, :flavor?], scope: [:capacity, :flavor]}

  def self.search(query)
    where(
      "brand LIKE ? OR capacity LIKE ? OR price LIKE ? OR quantiti LIKE ?",
      "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
    )
  end

  private
  def capacity_values
    unless (capacity == 250) || (capacity == 600) || (capacity == 1000)
      errors.add(:capacity, " - Containers can only contain 250ml, 600ml and 1L")
    end
  end

  def category_values
    unless (category === "PET") || (category === "GARRAFA") || (category === "LATA")
      errors.add(:category, " - The types of containers are PET, BOTTLE AND TIN")
    end
  end  
end
