class Person < ApplicationRecord
  has_many :tasks, foreign_key: 'assignee_id'
  has_many :projects, through: :tasks
end