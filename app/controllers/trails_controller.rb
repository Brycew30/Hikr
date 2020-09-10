class TrailsController < ApplicationController
  before_action :require_login
  before_action :set_trail, only: [:show]
  # GET /trails
  # GET /trails.json
  def index
    @trails = Trail.all.alphabetical_order
  end

  # GET /trails/1
  # GET /trails/1.json
  def show
  end

  # GET /trails/new
  def new
    @trail = Trail.new
    locations
  end

  # GET /trails/1/edit
  # def edit
  #   locations
  # end

  # POST /trails
  # POST /trails.json
  def create
    @trail = Trail.new(trail_params)
    locations
    respond_to do |format|
      if @trail.save
        format.html { redirect_to @trail, notice: 'Trail was successfully created.' }
        format.json { render :show, status: :created, location: @trail }
      else
        format.html { render :new }
        format.json { render json: @trail.errors, status: :unprocessable_entity }
      end
    end
    # raise params.inspect
  end

  def search
    @trails = Trail.search(params[:query])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trail
      @trail = Trail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trail_params
      params.require(:trail).permit(:name, :path_type, :length, :description, :location_id)
    end

    def locations
      @locations = Location.all
    end

end
