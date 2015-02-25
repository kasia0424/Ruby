class Vote < ActiveRecord::Base
  belongs_to :constituency
  belongs_to :committee
  attr_accessible :amount,
	:constituency_id,
	:committee_id

def self.get_votes(constituency_id, committees)
    Vote.includes(:committee).where("constituency_id = ?", constituency_id)
end

end
