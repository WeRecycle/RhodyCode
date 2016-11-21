class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /projects/1
  # GET /projects/1.json
  def show
    @user = User.find(params[:id])
    @projects = @user.owned_projects
  end
end
