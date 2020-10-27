class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/show/#{@user.id}")
    else
      render("users/new")
    end
  end

  def showpage
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
  
end
