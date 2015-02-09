class CommitteesVoivodeship < ActiveRecord::Base
  belongs_to :committee
  belongs_to :voivodeship
  attr_accessible :committee_id,
	:voivodeship_id
end
