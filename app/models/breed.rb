class Breed < ApplicationRecord
  has_many :horses

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "name", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "horses" ]
  end
end
