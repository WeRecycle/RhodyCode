class User < ApplicationRecord
  def self.gravatar_url(email,gravatar_options={})
    grav_url = 'http://www.gravatar.com/avatar.php?'
    grav_url << "gravatar_id=#{Digest::MD5.new.update(email)}"
    grav_url << "&rating=#{gravatar_options[:rating]}" if gravatar_options[:rating]
    grav_url << "&size=#{gravatar_options[:size]}" if gravatar_options[:size]
    grav_url << "&default=#{gravatar_options[:default]}" if gravatar_options[:default]
    grav_url << "&d=identicon"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owned_projects, class_name: "Project", foreign_key: "owner_id"
  has_and_belongs_to_many :tags
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: lambda{|attach| gravatar_url(attach.instance.email, size:300)}, escape_url: false
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
