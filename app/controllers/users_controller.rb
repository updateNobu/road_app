class UsersController < ApplicationController
  def new
  end

  def showpage
    @user = User.find_by(id: 1)
  end
end
