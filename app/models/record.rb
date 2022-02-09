class Record < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { only_integer: false, greated_than_or_equal_to: 0 }

  has_many :group_records, dependent: :delete_all
  has_many :groups, through: :group_records
  belongs_to :author, class_name: 'User'
end
