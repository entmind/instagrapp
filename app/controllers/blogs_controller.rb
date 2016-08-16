class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update, :destroy]
    # authenticate_user!はdive08で追記したよ。

  def index
    @blogs = Blog.all   # 記事全件を一覧表示するためよ。dive01
  end
  
  def new
    if params[:back]    # (name属性付きで)戻るボタン押下されて返ってきたときの挙動をif文で処理です。dive03
      @blog = Blog.new(blogs_params)    # (name属性付きなら)入力した記事をパラメータ保持で、@blogに格納するよ。dive03
    else
      @blog = Blog.new  # こちらはまったくの新規登録導線です。
    end
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?     # 確認画面へ遷移したときのためにバリデーションを追記したよ。dive03
                                      # バリデーションは保存したときのみ発動するので。dive03
  end

  
  def create
#    Blog.create(blogs_params)
#    redirect_to blogs_path, notice: "記事を作成しました！"

    @blog = Blog.new(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "記事を作成しました！"  # 一覧画面＆メッセージを表示します。
    else
      render action: 'new'  # 入力フォームを再描画します。
    end
  end

  def edit
#    @blog = Blog.find(params[:id])    # 保存しているデータをDBから取得しているよ。dive02
                                       # リファクタリングで省略したよ。dive02
  end

  def update
#    @blog = Blog.find(params[:id])     # 保存しているデータをDBから取得しているよ。dive02
#    @blog.update(blogs_params)         # dive02
#    redirect_to blogs_path, notice: "記事を更新しました！"

#    @blog = Blog.find(params[:id])
                                        # リファクタリングで省略したよ。dive02
    if @blog.update(blogs_params) 
      redirect_to blogs_path, notice: "記事を投稿(更新)しました！"
    else
      render action: 'edit'
    end
  end

  def destroy
#    @blog = Blog.find(params[:id])     # 保存しているデータをDBから取得しているよ。dive02
                                        # リファクタリングで省略したよ。dive02
    @blog.destroy
    redirect_to blogs_path, notice: "記事を削除しました！"
  end
  
  
  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    
    # idをキーとして値を取得するメソッド。リファクタリングで共通化したよ。dive02
    def set_blog
      @blog = Blog.find(params[:id])
    end

end
