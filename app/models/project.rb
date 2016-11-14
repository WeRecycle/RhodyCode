class Project < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_and_belongs_to_many :tags
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/normal/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
