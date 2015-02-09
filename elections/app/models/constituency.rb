class Constituency < ActiveRecord::Base
  belongs_to :voivodeship
  has_many :votes
  attr_accessible :empty_cards,
	:entitled,
	:given_cards,
	:invalid_votes,
	:multiple_choice,
	:other_invalid,
	:valid_votes,
	:voivodeship_id
end
