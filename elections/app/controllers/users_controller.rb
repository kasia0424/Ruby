class UsersController < ApplicationController
  def index
    @users = User.all
    @use = current_user
  end

  def new
    @user = User.new
  end

  def show
    @use = current_user
    if @use.role.name == "admin"
	     if params[:id] == "show"
		@user = @use
		@role = @use.role.name
	     else
		@user = User.find_by_id(params[:id])
		@role = @user.role.name
	     end
    elsif @use.role.name == "okregowy"
	Constituency.where("user_id = ?", @use.id).each do |const|
	   @const = const.id
        end
	#@const = Constituency.where("user_id = ?", @user.id)
	redirect_to  edit_constituency_path(@const)
	
    else
        @user = @use
	@role = @user.role.name
    
    #else if @user.role.name == "centralny"
#	redirect_to voivodeships_path
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration successful."
      redirect_to user_path
    else
      render :action => 'new'
    end
  end

  def role
      @user = User.find(params[:id])
      @role = Role.all.map do |rol|
	[rol.id]
     end
  end

  def edit
    @user = current_user
  end
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to login_path }
      format.json { head :no_content }
    end
  end
end
