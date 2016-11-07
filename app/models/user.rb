class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_projects, class_name: "Project", foreign_key: "owner_id"
  has_and_belongs_to_many :tags
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/normal/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
