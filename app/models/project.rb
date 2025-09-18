class Project < ApplicationRecord
  has_many :tasks
  has_many :people, through: :tasks
end
