class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  has_one_attached :icon
  has_many :group_records, dependent: :delete_all
  has_many :records, through: :group_records
  belongs_to :author, class_name: 'User'

  def total_record
    records.size
  end

  def total_record_amount
    p records
    sum = 0
    records.each do |record|
      sum += record.amount
    end
    sum
  end
end
