class Parsha < ActiveRecord::Base
  belongs_to :sefer
  has_one :person
end
