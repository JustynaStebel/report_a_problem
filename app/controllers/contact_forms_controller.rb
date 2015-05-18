class ContactFormsController < ApplicationController

  def index
    @contact_forms = ContactForm.all
  end

  def new
    @contact_form = ContactForm.new
  end

  def create
    contact_form = ContactForm.create(contact_form_params)
    if contact_form.save
       flash[:success] = "Formularz wysłany poprawnie!"
    else
       flash[:error] = "Ups...coś poszło nie tak :( Wyślij zgłoszenie raz jeszcze"
    end

    redirect_to contact_forms_path
  end

  def show
    @contact_form = ContactForm.find(params[:id])
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:email, :description, :category)
  end
end
