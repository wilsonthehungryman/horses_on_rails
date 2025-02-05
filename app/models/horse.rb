class Horse < ApplicationRecord
  belongs_to :breed

  validates :name, :age, :number_of_legs, :top_speed, presence: true
  validates :age, :number_of_legs, numericality: { only_integer: true }
end
