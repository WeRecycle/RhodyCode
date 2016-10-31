class Project < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_and_belongs_to_many :tags
end
