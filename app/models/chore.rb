class Chore < ApplicationRecord
  belongs_to :child
  has_many :tasks
end
