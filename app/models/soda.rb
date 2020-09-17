class Soda < ApplicationRecord

  validates_presence_of :brand, :category, :flavor, :capacity, :price, :quantiti
  validates_length_of :brand, maximum: 30, too_long: " - Enter a maximum of 30 characters."
  validates_numericality_of :capacity, :price, :quantiti
  validate :capacity_values
  validate :category_values
  validates :brand, uniqueness: {message: " - There is already the same capacity and flavor linked to this brand in the system!", if: [:capacity?, :flavor?], scope: [:capacity, :flavor]}

  def self.search(query)
    case query
      
    when "1L", "1l"
      where(
        "CAST(capacity AS TEXT) = ?", "1000"
      )
    when "600ml", "600ML"
      where(
        "CAST(capacity AS TEXT) = ?", "600"
      )
    when "250ml", "250ML"
      where(
        "CAST(capacity AS TEXT) = ?", "250"
      )
    else
      where(
        "brand LIKE ? OR CAST(capacity AS TEXT) LIKE ? OR CAST(price AS TEXT) LIKE ? OR CAST(quantiti AS TEXT) LIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%"
      )
    end
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
