class SecretTagging < ActiveRecord::Base
  attr_accessible :secret_id, :tag_id

  belongs_to :secret
  belongs_to :tag

  validates_presence_of :secret_id, :tag_id

end
