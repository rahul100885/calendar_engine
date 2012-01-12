class Recurrence < ActiveRecord::Base
  set_inheritance_column :repeat_type
  belongs_to :appointment
end
