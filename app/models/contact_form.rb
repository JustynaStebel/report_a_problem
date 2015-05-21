class ContactForm < ActiveRecord::Base

  FAILURE = 'Failure'
  DAMAGE = 'Damage'
  FAULT = 'Fault'

  CATEGORIES = [FAILURE, DAMAGE, FAULT]

  validates :category, presence: true, inclusion: { in: CATEGORIES }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :description, presence: true, length: { minimum: 100 }

  before_create :set_fields

  def set_fields
    now = Time.now

    case category when FAILURE
      if now.hour.between?(9,16)
        self.price = 50
      else
        self.price = 100
      end
      self.ect = now + 4.hours
    when DAMAGE
      self.price = 10
      self.ect = now + 24.hours
    when FAULT
      self.price = 1
      self.ect = now + 72.hours
    end
  end
end
