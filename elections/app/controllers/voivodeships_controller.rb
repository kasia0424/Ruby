class VoivodeshipsController < ApplicationController
#before_filter :authenticate_user!
  # GET /voivodeships
  # GET /voivodeships.json
  def index
    @voivodeships = Voivodeship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voivodeships }
    end
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
