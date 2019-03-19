class Task < ApplicationRecord
    has_many :users
    scope :user_id, -> (user_id) { where user_id: user_id }
    scope :status, -> (status) { where status: status }
    scope :priority, -> (priority) { where priority: priority }
    scope :due_date, -> (due_date) { where due_date: due_date }
    scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
    scope :today, -> { where(:due_date => Time.now.beginning_of_day..Time.now.end_of_day) }
    scope :week, -> { where(:due_date => Time.now.beginning_of_week..Time.now.end_of_week) }
    scope :month, -> { where(:due_date => Time.now.beginning_of_month..Time.now.end_of_month) }

end
