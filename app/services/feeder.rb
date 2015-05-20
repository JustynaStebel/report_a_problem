class Feeder
  def read_last_messages(n)
    messages = ContactForm.where(message_read: false).order(:created_at).limit(n)
    messages.update_all(message_read: true)
    messages.to_a
  end
end
