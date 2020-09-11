class SodasController < ApplicationController
  before_action :set_soda, only: [:show, :edit, :update, :destroy]

  # GET /sodas
  # GET /sodas.json
  def index
    @sodas = Soda.all
  end

  # GET /sodas/1
  # GET /sodas/1.json
  def show
  end

  # GET /sodas/new
  def new
    @soda = Soda.new
  end

  # GET /sodas/1/edit
  def edit
  end

  # POST /sodas
  # POST /sodas.json
  def create
    @soda = Soda.new(soda_params)

    respond_to do |format|
      if @soda.save
        format.html { redirect_to @soda, notice: 'Soda was successfully created.' }
        format.json { render :show, status: :created, location: @soda }
      else
        format.html { render :new }
        format.json { render json: @soda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sodas/1
  # PATCH/PUT /sodas/1.json
  def update
    respond_to do |format|
      if @soda.update(soda_params)
        format.html { redirect_to @soda, notice: 'Soda was successfully updated.' }
        format.json { render :show, status: :ok, location: @soda }
      else
        format.html { render :edit }
        format.json { render json: @soda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sodas/1
  # DELETE /sodas/1.json
  def destroy
    @soda.destroy
    respond_to do |format|
      format.html { redirect_to sodas_url, notice: 'Soda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soda
      @soda = Soda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def soda_params
      params.require(:soda).permit(:brand, :category, :flavor, :capacity, :price, :quantiti)
    end
end
