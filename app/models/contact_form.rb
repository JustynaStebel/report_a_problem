class ContactForm < ActiveRecord::Base

  CATEGORIES = ["awaria", "uszkodzenie", "usterka"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :description, presence: true, length: { minimum: 100 }

end
