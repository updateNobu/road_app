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
end