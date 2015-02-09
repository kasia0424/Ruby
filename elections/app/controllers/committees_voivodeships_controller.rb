class CommitteesVoivodeshipsController < ApplicationController
  # GET /committees_voivodeships
  # GET /committees_voivodeships.json
  def index
    @committees_voivodeships = CommitteesVoivodeship.all
	#@committees = Committee.all #where("voivodeship_id is not null")
	#@voivodeship = Voivodeship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @committees_voivodeships }
    end
  end

  # GET /committees_voivodeships/1
  # GET /committees_voivodeships/1.json
  def show
    @committees_voivodeship = CommitteesVoivodeship.find(params[:id])
    #@committees = Committee.all
    #@voivodeships = Voivodeship.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @committees_voivodeship }
    end
    #redirect_to :list_commi
  end

  def listc
    @commi_voi = CommitteesVoivodeship.find_by_committee_id(params[:id])
    @committee = Committee.find_by_id(params[:id])
    @voi = @committee.voivodeship
    #@voi_commi = Voivodeship.all.map do |voivodeships| 
    #   commi_voi.each do |commi_voi|
  #	  if(commi_voi.voivodeship_id == voivodeships.id)
#	      [voivodeships.name]
#	  end
#      end
#    end
    respond_to do |format|
      format.html # show_commi.html.erb
      format.json { render json: @committees_voivodeship }
    end

  end

  def listv
    @commi_voi = CommitteesVoivodeship.find_by_committee_id(params[:id])
    @voivodeship = Voivodeship.find_by_id(params[:id])
    @commi = @voivodeship.committees
    #@voi_commi = Voivodeship.all.map do |voivodeships| 
    #   commi_voi.each do |commi_voi|
  #	  if(commi_voi.voivodeship_id == voivodeships.id)
#	      [voivodeships.name]
#	  end
#      end
#    end
    respond_to do |format|
      format.html # show_commi.html.erb
      format.json { render json: @committees_voivodeship }
    end

  end

  # GET /committees_voivodeships/new
  # GET /committees_voivodeships/new.json
  def new
    @committees_voivodeship = CommitteesVoivodeship.new
	@committees = Committee.all.map do |commi|
		[commi.id]
	end
	@voivodeships = Voivodeship.all.map do |voi|
		[voi.id]
	end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @committees_voivodeship }
    end
  end

  # GET /committees_voivodeships/1/edit
  def edit
    @committees_voivodeship = CommitteesVoivodeship.find(params[:id])
	@committees = Committee.all.map do |commi|
		[commi.id]
	end
	@voivodeships = Voivodeship.all.map do |voi|
		[voi.id]
	end

  end

  # POST /committees_voivodeships
  # POST /committees_voivodeships.json
  def create
    @committees_voivodeship = CommitteesVoivodeship.new(params[:committees_voivodeship])

    respond_to do |format|
      if @committees_voivodeship.save
        format.html { redirect_to @committees_voivodeship, notice: 'Committees voivodeship was successfully created.' }
        format.json { render json: @committees_voivodeship, status: :created, location: @committees_voivodeship }
      else
        format.html { render action: "new" }
        format.json { render json: @committees_voivodeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /committees_voivodeships/1
  # PUT /committees_voivodeships/1.json
  def update
    @committees_voivodeship = CommitteesVoivodeship.find(params[:id])

    respond_to do |format|
      if @committees_voivodeship.update_attributes(params[:committees_voivodeship])
        format.html { redirect_to @committees_voivodeship, notice: 'Committees voivodeship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @committees_voivodeship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committees_voivodeships/1
  # DELETE /committees_voivodeships/1.json
  def destroy
    @committees_voivodeship = CommitteesVoivodeship.find(params[:id])
    @committees_voivodeship.destroy

    respond_to do |format|
      format.html { redirect_to committees_voivodeships_url }
      format.json { head :no_content }
    end
  end
end
