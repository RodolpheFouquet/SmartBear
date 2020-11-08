class BearsController < ApplicationController
  before_action :set_bear_list
  before_action :set_bear, only: [:show, :edit, :update, :destroy]

  # GET bear_lists/1/bears
  def index
    @bears = @bear_list.bears
  end

  # GET bear_lists/1/bears/1
  def show
  end

  # GET bear_lists/1/bears/new
  def new
    @bear = @bear_list.bears.build
  end

  # GET bear_lists/1/bears/1/edit
  def edit
  end

  # POST bear_lists/1/bears
  def create
    @bear = @bear_list.bears.build(bear_params)

    if @bear.save
      redirect_to(@bear.bear_list, notice: 'Bear was successfully created.')
    else
      redirect_to(@bear.bear_list, alert: 'Bear was successfully created.')
    end
  end

  # PUT bear_lists/1/bears/1
  def update
    if @bear.update_attributes(bear_params)
      redirect_to([@bear.bear_list, @bear], notice: 'Bear was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE bear_lists/1/bears/1
  def destroy
    @bear.destroy

    redirect_to bear_list_bears_url(@bear_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bear_list
      @bear_list = BearList.find(params[:bear_list_id])
    end

    def set_bear
      @bear = @bear_list.bears.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bear_params
      params.require(:bear).permit(:colour, :name, :portrait)
    end
end
