class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true  # Updated this line
  validates :phone_number, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "full_name", "id", "notes", "phone_number", "updated_at"]  # Updated this line
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w[image]
  end
end
