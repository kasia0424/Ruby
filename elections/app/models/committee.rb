class Committee < ActiveRecord::Base
  attr_accessible :logo_url,
	:name
  validates :logo_url, format: {with:/\Ahttp(s)?:/, allow_blank:true}
  has_and_belongs_to_many :voivodeship
  has_many :votes
end
