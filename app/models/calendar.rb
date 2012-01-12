class Calendar < ActiveRecord::Base
  has_many :appointments
  has_many :todos
end
