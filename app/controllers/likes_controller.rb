class LikesController < ApplicationController
  def create
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/#{@roadmap.category_id}")
  end
  
  def destroy
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/#{@roadmap.category_id}")
  end
  
  def createshow
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/#{@roadmap.category_id}/#{@roadmap.id}")
  end
  
  def destroyshow
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/#{@roadmap.category_id}/#{@roadmap.id}")
  end
  
  def createlike
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/user/#{@roadmap.user_id}/likepage")
  end
  
  def destroylike
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/user/#{@roadmap.user_id}/likepage")
  end
  
  def createlksw
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/likeshow/#{@roadmap.id}")
  end
  
  def destroylksw
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/likeshow/#{@roadmap.id}")
  end
  
  def createmroadi
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/user/mroadi/#{@roadmap.user_id}")
  end
  
  def destroymroadi
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/user/mroadi/#{@roadmap.user_id}")
  end
  
  def createmrims
    @like = Like.new(
      user_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.save
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/myshow/#{@roadmap.id}")
  end
  
  def destroymrims
    @like = Like.find_by(
      User_id: @current_user.id,
      roadmap_id: params[:roadmap_id]
    )
    @like.destroy
    @roadmap = Roadmap.find_by(id: params[:roadmap_id])
    redirect_to("/roadmap/myshow/#{@roadmap.id}")
  end
end