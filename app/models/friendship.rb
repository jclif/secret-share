class Friendship < ActiveRecord::Base
  attr_accessible :stalker_id, :victim_id

  belongs_to :stalker,
  class_name: "User",
  foreign_key: :stalker_id,
  primary_key: :id

  belongs_to :victim,
  class_name: "User",
  foreign_key: :victim_id,
  primary_key: :id

  validates :stalker_id, :victim_id, presence: true

end
