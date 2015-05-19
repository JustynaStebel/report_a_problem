class Dashboard
  include ContactForm

  last_message = nil

  def get_read_messages
    unread_messages = Array.new
    @contact_forms.each do |contact_form|
      if contact_form.message_read == false
        unread_messages << contact_form
      end
    return unread_messages

  end

end
