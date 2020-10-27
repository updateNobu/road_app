class RoadmapsController < ApplicationController
  
  def new
   @roadmap = Roadmap.new
  end
  
  def edit
    @roadmap = Roadmap.find_by(id: params[:id])
    if @roadmap.category_id == 1
      @a = "checked"
    elsif @roadmap.category_id == 2
      @b = "checked"
    elsif @roadmap.category_id == 3
      @c = "checked"
    elsif @roadmap.category_id == 4
      @d = "checked"
    end
  end
  
  def editsend
    @roadmap_shows = Roadmapshow.where(roadmap_id: params[:id])
    @id = params[:id]
    # @roadmap_show = Roadmapshow.find_by(roadmap_id: params[:id])
  end
  
  def fini
    @roadmap_show = Roadmapshow.new(roadmap_show_params)
    @roadmap = Roadmap.find_by(id: @roadmap_show.roadmap_id)
    if params[:finish]
      @roadmap_show.save
      redirect_to ("/roadmap/#{@roadmap.category_id}/#{@roadmap_show.roadmap_id}")
      flash[:notice]= "編集成功！"
    else
      if !@roadmap_show.save
        flash[:notice]= "項目をすべて埋めてください"
      end
      redirect_to ("/roadmap/editsend/#{@roadmap_show.roadmap_id}")
    end
  end
  
  def mfini
    @roadmap_show = Roadmapshow.new(roadmap_show_params)
    @roadmap = Roadmap.find_by(id: @roadmap_show.roadmap_id)
    if params[:finish]
      @roadmap_show.save
      redirect_to ("/user/road/#{@roadmap.user_id}")
      flash[:notice]= "編集成功！"
    else
      if !@roadmap_show.save
        flash[:notice]= "項目をすべて埋めてください"
      end
      redirect_to ("/roadmap/mapedit/#{@roadmap_show.roadmap_id}")
    end
  end
  
  def update
    @roadmap = Roadmap.find_by(id: params[:id])
    @roadmap.title = params[:title]
    @roadmap.stady_time_week = params[:stady_time_week]
    @roadmap.stady_time_holiday = params[:stady_time_holiday]
    @roadmap.period_stady = params[:period_stady]
    @roadmap.total_stady_time = params[:total_stady_time]
    @roadmap.total_comment = params[:total_comment]
    @roadmap.category_id = params[:category_id]
    @roadmap.save
    if params[:continue]
      redirect_to("/roadmap/editsend/#{@roadmap.id}")
    else
      redirect_to("/roadmap/#{@roadmap.category_id}/#{@roadmap.id}")
      flash[:notice]= "編集成功！"
    end
  end
  
  
  def create
    @roadmap = Roadmap.new(roadmap_params)
    @roadmap.user_id= "1"    # 本来はcurrentuserに送りたい
    if @roadmap.save
     redirect_to ("/roadmap/new/#{@roadmap.id}")
    else
     redirect_to ("/roadmap/new")
     flash[:notice]= "項目をすべて埋めてください"
    end
  end
  
  def roadmap_params
    params.permit(:title, :stady_time_week, :stady_time_holiday, :period_stady, :total_stady_time, :total_comment, :category_id)
  end
  
  
  def front
    @roadmaps = Roadmap.where(category_id: 1)
    @user = User.find_by(id: Roadmap.find_by(category_id: 1).user_id)
  end
  
  def back
    @roadmaps = Roadmap.where(category_id: 2)
    @user = User.find_by(id: Roadmap.find_by(category_id: 1).user_id)
  end
  
  def web
    @roadmaps = Roadmap.where(category_id: 3)
  end
  
  def free
    @roadmaps = Roadmap.where(category_id: 4)
  end
  
  def show
    @roadmap = Roadmap.find_by(id: params[:id])
    @user = User.find_by(id: @roadmap.user_id)
    @roadmap_shows = Roadmapshow.where(roadmap_id: params[:id])
  end
  
  def myshow
    @roadmap = Roadmap.find_by(id: params[:id])
    @user = User.find_by(id: @roadmap.user_id)
    @roadmap_shows = Roadmapshow.where(roadmap_id: params[:id])
  end
  
  def new_show
    @roadmap_shows = Roadmapshow.where(roadmap_id: params[:id])
    @id = params[:id]
  end
  
  def add #ロードマップ詳細ページでロードマップを増やしたいときに押す　今ある情報をセーブする
    @roadmap_show = Roadmapshow.new(roadmap_show_params)
    @roadmap = Roadmap.find_by(id: @roadmap_show.roadmap_id)
    if @roadmap_show.save
     if params[:finish]
        redirect_to ("/roadmap/#{@roadmap.category_id}")
        flash[:notice]= "投稿完了！"
     else
        redirect_to("/roadmap/new/#{@roadmap_show.roadmap_id}")
     end
    else 
       flash[:notice]= "項目をすべて埋めてください"
       redirect_to ("/roadmap/new/#{@roadmap_show.roadmap_id}")
    end
  end
  
  def roadmap_show_params
    params.permit(:content, :method, :time_required, :comment, :roadmap_id)
  end
  
  def editshow
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
  end
  
  def editz
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
  end
  
  def medit
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
  end
  
  def updateshow
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @roadmapshow.content = params[:content]
    @roadmapshow.method = params[:method]
    @roadmapshow.time_required = params[:time_required]
    @roadmapshow.comment = params[:comment]
    if @roadmapshow.save
      redirect_to("/roadmap/new/#{@roadmapshow.roadmap_id}")
      flash[:notice]= "投稿完了！"
    else
      render("roadmaps/editshow")
    end
  end
  
  # def roadmapshow_params
  #   params.permit(:content, :method, :time_required, :comment)
  # end
  
  def destroyshow
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @Roadmapshow.destroy
    redirect_to("/roadmap/new/#{@roadmapshow.roadmap_id}")
    flash[:notice]= "ロードマップを削除しました。"
  end
  
  def destroyz
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @roadmapshow.destroy
    redirect_to("/roadmap/editsend/#{@roadmapshow.roadmap_id}")
  end
  
  def destroymap
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @roadmapshow.destroy
    redirect_to("/roadmap/mapedit/#{@roadmapshow.roadmap_id}")
  end
  
  def destroyall
    @roadmap = Roadmap.find_by(id: params[:id])
    @roadmap.destroy
    redirect_to("/roadmap/#{@roadmap.category_id}")
    flash[:notice]= "投稿を削除しました。"
  end
  
  def destroymy
    @roadmap = Roadmap.find_by(id: params[:id])
    @roadmap.destroy
    redirect_to("/user/mroadi/#{@roadmap.user_id}")
    flash[:notice]= "投稿を削除しました。"
  end
  
  def updateedit
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @roadmapshow.content = params[:content]
    @roadmapshow.method = params[:method]
    @roadmapshow.time_required = params[:time_required]
    @roadmapshow.comment = params[:comment]
    if @roadmapshow.save
      redirect_to("/roadmap/editsend/#{@roadmapshow.roadmap_id}")
      flash[:notice]= "編集成功！"
    else
      render("roadmaps/editz")
    end
  end
  
  def updatemap
    @roadmapshow = Roadmapshow.find_by(id: params[:id])
    @roadmapshow.content = params[:content]
    @roadmapshow.method = params[:method]
    @roadmapshow.time_required = params[:time_required]
    @roadmapshow.comment = params[:comment]
    @roadmap = Roadmap.find_by(id: @roadmapshow.roadmap_id)
    if @roadmapshow.save
      redirect_to("/roadmap/mapedit/#{@roadmap.user_id}")
      flash[:notice]= "編集成功！"
    else
      render("roadmaps/medit")
    end
  end
  
  def mapedit
    @user = User.find_by(id: params[:id])
    @id = @user.mymap
    @mymaps = Roadmapshow.where(roadmap_id: @user.mymap)
  end
end
