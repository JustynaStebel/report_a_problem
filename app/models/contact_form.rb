class ContactForm < ActiveRecord::Base

  CATEGORIES = ["Awaria", "Uszkodzenie", "Usterka"]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :description, presence: true, length: { minimum: 100 }

end
