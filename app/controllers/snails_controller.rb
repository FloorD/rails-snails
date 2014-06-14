class SnailsController < ApplicationController
  before_action :set_snail, only: [:show, :edit, :update, :destroy]

  # GET /snails
  # GET /snails.json
  def index
    @snails = Snail.all
  end

  # GET /snails/1
  # GET /snails/1.json
  def show
  end

  # GET /snails/new
  def new
    @snail = Snail.new
  end

  # GET /snails/1/edit
  def edit
  end

  # POST /snails
  # POST /snails.json
  def create
    @snail = Snail.new(name: params[:snail][:name], owner: params[:snail][:owner], description: params[:snail][:description], speed: Random.new.rand(1..10), endurance: Random.new.rand(1..10), motivation: Random.new.rand(1..10), win: 0, lose: 0)

    respond_to do |format|
      if @snail.save
        format.html { redirect_to @snail, notice: 'Snail was successfully created.' }
        format.json { render :show, status: :created, location: @snail }
      else
        format.html { render :new }
        format.json { render json: @snail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snails/1
  # PATCH/PUT /snails/1.json
  def update
    respond_to do |format|
      if @snail.update(snail_params)
        format.html { redirect_to @snail, notice: 'Snail was successfully updated.' }
        format.json { render :show, status: :ok, location: @snail }
      else
        format.html { render :edit }
        format.json { render json: @snail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snails/1
  # DELETE /snails/1.json
  def destroy
    @snail.destroy
    respond_to do |format|
      format.html { redirect_to snails_url, notice: 'Snail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snail
      @snail = Snail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snail_params
      params.require(:snail).permit(:name, :owner, :description)
    end
end
