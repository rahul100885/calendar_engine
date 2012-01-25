class Calendar < ActiveRecord::Base
  has_many :appointments, :dependent => :destroy
  has_many :todos, :dependent => :destroy
end
