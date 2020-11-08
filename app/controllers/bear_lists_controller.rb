class BearListsController < ApplicationController
  before_action :set_bear_list, only: [:show, :edit, :update, :destroy]
  layout "homepage", :only => [ :index ]
  # GET /bear_lists
  # GET /bear_lists.json
  def index
    @bear = Bear.new
    @bear_lists = BearList.all
  end

  # GET /bear_lists/1
  # GET /bear_lists/1.json
  def show
    @bear = @bear_list.bears.build
    @list = @bear_list.bears[0...-1]
  end

  # GET /bear_lists/new
  def new
    @bear_list = BearList.new
  end

  # GET /bear_lists/1/edit
  def edit
  end

  # POST /bear_lists
  # POST /bear_lists.json
  def create
    @bear_list = BearList.new(bear_list_params)

    respond_to do |format|
      if @bear_list.save
        format.html { redirect_to @bear_list, notice: 'Bear list was successfully created.' }
        format.json { render :show, status: :created, location: @bear_list }
      else
        format.html { render :new }
        format.json { render json: @bear_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bear_lists/1
  # PATCH/PUT /bear_lists/1.json
  def update
    respond_to do |format|
      if @bear_list.update(bear_list_params)
        format.html { redirect_to @bear_list, notice: 'Bear list was successfully updated.' }
        format.json { render :show, status: :ok, location: @bear_list }
      else
        format.html { render :edit }
        format.json { render json: @bear_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bear_lists/1
  # DELETE /bear_lists/1.json
  def destroy
    @bear_list.destroy
    respond_to do |format|
      format.html { redirect_to bear_lists_url, notice: 'Bear list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bear_list
      @bear_list = BearList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bear_list_params
      params.require(:bear_list).permit(:title)
    end
end
