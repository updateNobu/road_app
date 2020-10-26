class UsersController < ApplicationController
  def new
  end

  def showpage
    @user = User.find_by(id: 1)
  end
  
  def roadeach
    @user = User.find_by(id: 1)
    @mymaps = Roadmapshow.where(roadmap_id: @user.mymap)
  end
  
  def singup
  end
end
