class ContactFormsController < ApplicationController

  def index
    @contact_forms = ContactForm.all
  end

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)
    if @contact_form.save
      flash.now[:success] = "Form sent successfully!"
      redirect_to contact_forms_path
    else
      flash.now[:error] = "Something went wrong, send your form once again"
      render :new
    end
  end

  def show
    @contact_form = ContactForm.find(params[:id])
    @contact_form.message_read = true
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:email, :description, :category)
  end
end
