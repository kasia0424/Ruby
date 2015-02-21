class RolesUsersController < ApplicationController
  before_filter :set_roles_user, only: [:show, :edit, :update, :destroy]
#load_and_authorize_resource
  respond_to :html

  def index
    @roles_users = RolesUser.all
    respond_with(@roles_users)
  end

  def show
    respond_with(@roles_user)
  end

  def new
    @roles_user = RolesUser.new
    @roles = Role.all.map do |rol|
	[rol.id]
     end
    @users = User.all.map do |us|
	[us.id]
    end
    respond_with(@roles_user)
  end

  def edit
    @roles_user = RolesUser.find_by_id(params[:roles_user])
    @roles = Role.all.map do |rol|
	[rol.id]
     end
    @users = User.all.map do |us|
	[us.id]
    end
    respond_with(@roles_user)
  end

  def create
    @roles_user = RolesUser.new(params[:roles_user])
    @roles_user.save
    respond_with(@roles_user)
  end

  def update
    @roles_user.update_attributes(params[:roles_user])
    respond_with(@roles_user)
  end

  def destroy
    @roles_user.destroy
    respond_with(@roles_user)
  end

  private
    def set_roles_user
      @roles_user = RolesUser.find(params[:id])
    end
end
