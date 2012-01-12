class Todo < ActiveRecord::Base
  belongs_to :calendar
  has_many :reminders, :as => :event
end
