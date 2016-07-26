class ContactsController < ApplicationController
  def new
    if params[:back]    # dive03課題で追記したよ。
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
#    Contact.create(contacts_params)
#    redirect_to contacts_path, notice: "お問い合わせありがとうございました！"
    
    @contact = Contact.create(contacts_params)
    if @contact.save
      redirect_to root_path, notice: "お問い合わせが完了しました！　ありがとうございました！"  # root_pathに変更したよ。dive04課題
    else
      render action: 'new'
    end
  end
  
  def confirm    # dive03課題で追記したよ。
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
    
end
