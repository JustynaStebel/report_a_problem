class Feeder
  def read_last_messages(n, options = {})
    messages = ContactForm.where(message_read: false).order(:created_at)
    messages = messages.where(category: options[:category]) if options[:category]
    messages = messages.where(email: options[:email]) if options[:email]
    messages = messages.where(price: options[:price]) if options[:price]
    messages = messages.limit(n)

    messages.update_all(message_read: true)
    messages.to_a
  end
end
