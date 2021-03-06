class VoivodeshipsController < ApplicationController
#before_filter :authenticate_user!
load_and_authorize_resource
  # GET /voivodeships
  # GET /voivodeships.json
  def index
    @voivodeships = Voivodeship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voivodeships }
    end
  end
  def frekwencja
	@voi = Voivodeship.find_by_id(params[:id])
	@constituency = Constituency.where("voivodeship_id = ? AND given_cards IS NOT NULL", params[:id])
	@voters = @constituency.sum(:entitled)
	@cards = @constituency.sum(:given_cards)
	@committees = Committee.all
	if @voters != 0 && @cards!=0
	  @frekwencja = @cards*100/@voters
	else
	  @frekwencja = 0
	end
  end

  def results
	@voivodeship = Voivodeship.find_by_id(params[:id])
	constituency = Constituency.where("voivodeship_id = ? AND valid_votes IS NOT NULL", params[:id])
	#@suma = 0
	@votes = constituency.map do |vot|
	   Vote.where("constituency_id = ?", vot)
	end

	comm = Committee.all 
	@suma = comm.map do |comm|
	   @votes.map do |cons|
	     cons.where("committee_id = ?", comm).sum(:amount)
	#   end
	   end
	end
        @size = @suma.size
@sumsum = Hash.new
for i in 0..@size
	#@suma.each do |sum|
	#    sum.each do |su|
	@sumsum[i] = @suma[i] #sum[0]+su[1]
	#    end 
end


  end

  def invalid
	@voi = Voivodeship.find_by_id(params[:id])
	cons = Constituency.where("voivodeship_id = ? AND invalid_votes IS NOT NULL", params[:id])
	@invalid = cons.sum(:invalid_votes)
	@empty = cons.sum(:empty_cards)
	@multiple = cons.sum(:multiple_choice)
	@other = cons.sum(:other_invalid)	
  end

  # GET /voivodeships/1
  # GET /voivodeships/1.json
  def show
    @voivodeship = Voivodeship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voivodeship }
    end
  end

  # GET /voivodeships/new
  # GET /voivodeships/new.json
  def new
    @voivodeship = Voivodeship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voivodeship }
    end
  end

  # GET /voivodeships/1/edit
  def edit
    @voivodeship = Voivodeship.find(params[:id])
  end

  # POST /voivodeships
  # POST /voivodeships.json
  def create
    @voivodeship = Voivodeship.new(params[:voivodeship])

    respond_to do |format|
      if @voivodeship.save
        format.html { redirect_to @voivodeship, notice: 'Voivodeship was successfully created.' }
        format.json { render json: @voivodeship, status: :created, location: @voivodeship }
      else
        format.html { render action: "new" }
        format.json { render json: @voivodeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voivodeships/1
  # PUT /voivodeships/1.json
  def update
    @voivodeship = Voivodeship.find(params[:id])

    respond_to do |format|
      if @voivodeship.update_attributes(params[:voivodeship])
        format.html { redirect_to @voivodeship, notice: 'Voivodeship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voivodeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voivodeships/1
  # DELETE /voivodeships/1.json
  def destroy
    @voivodeship = Voivodeship.find(params[:id])
    @voivodeship.destroy

    respond_to do |format|
      format.html { redirect_to voivodeships_url }
      format.json { head :no_content }
    end
  end
end
