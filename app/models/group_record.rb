class GroupRecord < ApplicationRecord
  belongs_to :record
  belongs_to :group
end
