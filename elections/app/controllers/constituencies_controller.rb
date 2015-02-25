class ConstituenciesController < ApplicationController
#before_filter :authenticate_user!
#load_and_authorize_resource
  # GET /constituencies
  # GET /constituencies.json
  def index
    if current_user.role.name == "okregowy"
	@constituencies = Constituency.where("user_id = ?", current_user.id)
    else
        @constituencies = Constituency.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @constituencies }
    end
  end
  def frekwencja
	@constituency = Constituency.find_by_id(params[:id])
	@frekwencja = @constituency.given_cards*100/@constituency.entitled

  end

  # GET /constituencies/1
  # GET /constituencies/1.json
  def show
    @constituency = Constituency.find(params[:id])
    votes = @constituency.valid_votes.to_i + @constituency.invalid_votes.to_i
    cards = @constituency.given_cards.to_i - votes 
    if votes > @constituency.given_cards.to_i
	@cards = 0
    elsif cards <0
	@cards = -cards
    else
	@cards = cards
    end
    @left = @constituency.entitled.to_i - @constituency.given_cards.to_i

    respond_to do |format|
      format.html #show.html.erb
      format.json { render json: @constituency }
    end
  end

  def listconst
    id = params[:id]
    @voivodeship = Voivodeship.find_by_id(params[:id])
    @const = Constituency.where("voivodeship_id = ?", params[:id])
    #@commi = @voivodeship.committees

    respond_to do |format|
      format.html # show_commi.html.erb
      format.json { render json: @committees_voivodeship }
    end
  end

  # GET /constituencies/new
  # GET /constituencies/new.json
  def new
    @constituency = Constituency.new
    @voivodeship = Voivodeship.all.map do |voi|
	[voi.id]
     end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @constituency }
    end
  end

  # GET /constituencies/1/edit
  def edit
    @constituency = Constituency.find(params[:id])
    @voivodeship = Voivodeship.all.map do |voi|
	[voi.id]
     end
  end

  def listconsti
    @const = Constituency.find_by_id(params[:id])
    @voivodeship = @const.voivodeship_id
    comm = CommitteesVoivodeship.where("voivodeship_id = ?", @voivodeship)
    sum = 0
    @results = Hash.new
    @coo = Committee.all #.each do |c|
    #  comm.each do |com|
    #    if c.id == com
    #      @committees = c
    #    end 
    #  end
    #end
    i=0
    @comis = Hash.new
    
    @coo.each do |com|
      @comis[i] = com.name
      i=i+1
    end
    @rozm = -1
    comm.each do |committee|
      Vote.where("committee_id = ? AND constituency_id = ?", committee.id, @const.id).each { |v| sum += v.amount }
      @results[committee] = sum
      sum = 0
      @rozm +=1
    end
    @size = @rozm
  end




  def add_user
    @user = User.find_by_id(params[:id])
    @constituency = Constituency.all
  end

  # POST /constituencies
  # POST /constituencies.json
  def create
    @constituency = Constituency.new(params[:constituency])

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: 'Constituency was successfully created.' }
        format.json { render json: @constituency, status: :created, location: @constituency }
      else
        format.html { render action: "new" }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /constituencies/1
  # PUT /constituencies/1.json
  def update
    @constituency = Constituency.find(params[:id])

    respond_to do |format|
      if @constituency.update_attributes(params[:constituency])
        format.html { redirect_to @constituency, notice: 'Constituency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1
  # DELETE /constituencies/1.json
  def destroy
    @constituency = Constituency.find(params[:id])
    @constituency.destroy

    respond_to do |format|
      format.html { redirect_to constituencies_url }
      format.json { head :no_content }
    end
  end
end
