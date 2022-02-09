class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_entities, dependent: :delete_all
  has_many :entities, through: :group_entities
  belongs_to :author, class_name: 'User'
end
