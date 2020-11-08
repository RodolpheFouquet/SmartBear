class Bear < ApplicationRecord
  belongs_to :bear_list
  validates :name, presence: true
  validates :portrait, presence: true
  validates :colour, presence: true
end
