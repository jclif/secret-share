class Tag < ActiveRecord::Base
  attr_accessible :name, :user_id

  has_many :secret_taggings

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :secrets, through: :secret_taggings, source: :tag

end
