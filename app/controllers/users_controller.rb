class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout, :destroy]}
  before_action :forbid_login_user, {only: [:login_form, :login, :new, :create]}
  before_action :ensure_correct_user, {only: [:showedit, :updateshow]}
  before_action :admin_user,     only: :destroy
  
  def admin_user
      redirect_to("/") unless @current_user.admin?
  end
    
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]= "権限がありません"
      redirect_to("/")
    end
  end
  
  
  def new
    @user = User.new
  end
  
  def login_form
    @user = User.new
  end
  
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/user/show/#{@user.id}")
    else
      @error_massage = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
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
      image_name: "default.png",
    )
    if @user.save
      session[:user_id]=@user.id
      @roadmap = Roadmap.create(title: "-", stady_time_week: 0, stady_time_holiday: 0, period_stady: 0, total_stady_time: 0, total_comment: "My ロードマップを作ろう", user_id: "#{@user.id}", category_id: 1, display: false)
      @user.update(mymap: "#{@roadmap.id}")
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
    @roadmap = Roadmap.find_by(id: @user.mymap)
    @mymaps = Roadmapshow.where(roadmap_id: @user.mymap)
  end
  
  def mroadi
    @user = User.find_by(id: params[:id])
    @roadmaps = Roadmap.where(user_id: @user.id).where(display: true).order(updated_at: "DESC")
  end
  
  def cfmroad
    @user = User.find_by(id: params[:id])
    @roadmaps = Roadmap.where(user_id: @current_user.id).where(display: true).order(updated_at: "DESC")
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
    if @user.save(validate: false)
      redirect_to("/user/show/#{@user.id}")
      flash[:notice]= "投稿完了！"
    else
      render("users/showedit")
    end
  end
  
  def likepage
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).order(updated_at: "DESC")
  end
  
  def cflike
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).order(updated_at: "DESC")
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to("/")
  end

  
  
end