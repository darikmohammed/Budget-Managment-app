class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entities

  def amount
    entities.includes(:groups).sum(:amount)
  end
end
