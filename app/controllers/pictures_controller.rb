class PicturesController < ApplicationController
  # authenticate_user!はdive08で追記したよ。dive09でも登場した。
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]

  # @pictures = Picture.all  記事全件を一覧表示するためよ。dive01
  def index
    @pictures = Picture.all
  end

  # if params[:back]    (name属性付きで)戻るボタン押下されて返ってきたときの挙動をif文で処理です。dive03
  # @picture = Picture.new(pictures_params)    (name属性付きなら)入力した記事をパラメータ保持で、@pictureに格納するよ。dive03
  # @picture = Picture.new    こちらはまったくの新規登録導線です。
  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
      @picture.user_id = current_user.id
    else
      @picture = Picture.new
    end
  end

  # render :new if @picture.invalid?    確認画面へ遷移したときのためにバリデーションを追記したよ。dive03
  #                                  バリデーションは保存したときのみ発動するので。dive03
  def confirm
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  # Picture.create(pictures_params)
  # redirect_to pictures_path, notice: "記事を作成しました！"    一覧画面＆メッセージを表示します。
  # render action: 'new'    入力フォームを再描画します。
  # @picture.user_id = current_user.id    dive09で追記したよ。
  # NoticeMailer.sendmail_picture(@picture).deliver    dive11で追記したよ。
  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "記事を作成しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render action: 'new'
    end
  end

  # @picture = Picture.find(params[:id])    保存しているデータをDBから取得しているよ。dive02
  #                                   リファクタリングで省略したよ。dive02
  def edit
  end

  # @picture = Picture.find(params[:id])     # 保存しているデータをDBから取得しているよ。dive02
  # @picture.update(pictures_params)         # dive02
  # redirect_to pictures_path, notice: "記事を更新しました！"
  # @picture = Picture.find(params[:id])
  # リファクタリングで省略したよ。dive02
  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "記事を投稿(更新)しました！"
    else
      render action: 'edit'
    end
  end

  # @picture = Picture.find(params[:id])    保存しているデータをDBから取得しているよ。dive02
  # リファクタリングで省略したよ。dive02
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "記事を削除しました！"
  end


  private
    def pictures_params
      params.require(:picture).permit(:title, :content, :user_id, :name)
    end

    # idをキーとして値を取得するメソッド。リファクタリングで共通化したよ。dive02
    def set_picture
      @picture = Picture.find(params[:id])
    end

end
