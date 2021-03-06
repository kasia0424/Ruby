class VotesController < ApplicationController
#before_filter :authenticate_user!
#before_filter :set_committees, only: [:new, :edit, :update, :destroy]
#before_filter :set_constituencies, only: [:new, :edit, :update, :destroy]
load_and_authorize_resource

  # GET /votes
  # GET /votes.json
  def index
    if current_user.role.name == "okregowy"
      Constituency.where("user_id = ?", current_user.id).each do |con|
        @const = con.id
      end
      @votes = Vote.where("constituency_id = ?", @const) 
    else
      @votes = Vote.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end

  def listconsti
    @votes = Vote.find_by_constituency_id(params[:id])
    @const = Constituency.find_by_id(params[:id])
    voivodeship = @const.voivodeship.id
    comm = Committees_voivodeship.find_by_voivodeship_id(voivodeship)
    @committees_votes = Constituency.count_votes_for_committees(@const, comm)
    #@commi = @voivodeship.committees

    respond_to do |format|
      format.html # show_commi.html.erb
      format.json { render json: @committees_voivodeship }
    end
  end

  # GET /votes/new
  # GET /votes/new.json
  def new
    @vote = Vote.new
    Constituency.where("user_id = ?", current_user.id).each do |con|
      @const = con
    end
    #@committee = Committee.all.map do |commi|
	#[commi.id]
     #end
    @constituency = Constituency.all.map do |consti|
        [consti.id]
     end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
    Constituency.where("user_id = ?", current_user.id).each do |con|
      @const = con
    end
    
    @constituency = Constituency.all.map do |consti|
        [consti.id]
     end
    @committee = Committee.all.map do |commi|
	[commi.id]
     end
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { render action: "new" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /votes/1
  # PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end

  def set_committees
     @committee = Committee.all.map do |commi|
	[commi.id]
     end
  end


  def set_constituencies
     @constituency = Constituency.all.map do |consti|
        [consti.id]
     end
  end

end
