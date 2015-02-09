class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :committees
  has_many :constituencies
  attr_accessible :mandates,
	:name
end
