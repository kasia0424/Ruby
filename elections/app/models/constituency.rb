class Constituency < ActiveRecord::Base
  belongs_to :voivodeship
  has_many :votes
  has_and_belongs_to_one :user
  attr_accessible :empty_cards,
	:entitled,
	:given_cards,
	:invalid_votes,
	:multiple_choice,
	:other_invalid,
	:valid_votes,
	:voivodeship_id,
	:user_id

def invalid_votes
  self.invalid_votes = self.multiple_choice.to_i + self.other_invalid.to_i + self.empty_cards.to_i
end

end
