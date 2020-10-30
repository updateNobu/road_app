class UsersController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, {only: [:logout]}
  before_action :forbid_login_user, {only: [:login_form, :login, :new, :create]}
  before_action :ensure_correct_user, {only: [:showedit, :updateshow]}
  
  
  def new
    @user = User.new
  end
  
  def login_form
    @user = User.new
  end
  
  
  def login
    @user = User.find_by(email: params[:email], password: [:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/user/show/#{@user.id}")
    else
      @error_massage = "メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end
  
  def logout
      session[:user_id] = nil
      flash[:notice] = "ログアウトしました"
      redirect_to("/")
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default.png"
    )
    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/show/#{@user.id}")
    else
      render("users/new")
    end
  end

  def showpage
    @user = User.find_by(id: params[:id])
  end
  
  def showedit
    @user = User.find_by(id: params[:id])
  end
  
  def roadeach
    @user = User.find_by(id: params[:id])
    @mymaps = Roadmapshow.where(roadmap_id: @user.mymap)
  end
  
  def mroadi
    @user = User.find_by(id: params[:id])
    @roadmaps = Roadmap.where(user_id: @user.id)
  end
  
  def updateshow
    @user = User.find_by(id: params[:id])
    # @user.写真 = params[:content]
    @user.name = params[:name]
    @user.comment = params[:comment]
    @user.link = params[:link]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      redirect_to("/user/show/#{@user.id}")
      flash[:notice]= "投稿完了！"
    else
      render("users/showedit")
    end
  end
  
  
end