class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :billboards, through: :songs
  
  
  validates :first_name, :last_name, :age, presence: true
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
