class ContactsController < ApplicationController

  # if params[:back]    dive03課題で追記したよ。
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  # Contact.create(contacts_params)
  # redirect_to contacts_path, notice: "お問い合わせありがとうございました！"
  # redirect_to root_path, notice: "お問い合わせが完了しました！　ありがとうございました！"    root_pathに変更したよ。dive04課題
  def create
    @contact = Contact.create(contacts_params)
    if @contact.save
      redirect_to root_path, notice: "お問い合わせが完了しました！　ありがとうございました！"
    else
      render action: 'new'
    end
  end
  
  # dive03課題で追記したよ。
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
    
end