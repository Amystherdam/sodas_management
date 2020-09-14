class SodasController < ApplicationController
  before_action :set_soda, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /sodas
  # GET /sodas.json
  def index
    if params[:search]
      @sodas = Soda.search(params[:search]).paginate(page: params[:page], per_page: 10).order('created_at DESC')
    else
      @sodas = Soda.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    end
  end

  def destroy_multiple
    if params.has_key?(:soda_ids)
      Soda.destroy(params[:soda_ids])

      respond_to do |format|
          format.html { redirect_to sodas_path, notice: 'No sodas found.' }
          format.json { head :no_content }
      end
      
    else
      redirect_to sodas_path
    end
  end

  # GET /sodas/1
  # GET /sodas/1.json
  def show
    @translates = Soda.all
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
        format.html { redirect_to @soda, notice: t(:confirm_create_soda) }
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
        format.html { redirect_to @soda, notice: t(:confirm_update_soda) }
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
      format.html { redirect_to sodas_url, notice: t(:confirm_destroy_soda) }
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
