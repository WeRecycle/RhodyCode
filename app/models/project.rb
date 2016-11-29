class Project < ApplicationRecord
  def self.gravatar_url(email,gravatar_options={})
    grav_url = 'http://www.gravatar.com/avatar.php?'
    grav_url << "gravatar_id=#{Digest::MD5.new.update(email)}"
    grav_url << "&rating=#{gravatar_options[:rating]}" if gravatar_options[:rating]
    grav_url << "&size=#{gravatar_options[:size]}" if gravatar_options[:size]
    grav_url << "&default=#{gravatar_options[:default]}" if gravatar_options[:default]
    grav_url << "&d=identicon"
  end

  def self.getTitle()
    return self.title
  end
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_and_belongs_to_many :tags
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: lambda{|attach| gravatar_url(attach.instance.title, size:300)}, escape_url: false
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
