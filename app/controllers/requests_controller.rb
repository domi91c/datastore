class RequestsController < ApplicationController
  before_action :set_request, only: [ :show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
	  @requests = Request.all.page(params[:page]).per(5)

	  if params[:search]
		  @requests = Request.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
	  else
		  @requests = Request.all.order('created_at DESC').page(params[:page]).per(5)
	  end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
	  @request  = Request.find(params[:id])
	  unless @request.gallery.nil?
		  @gallery = @request.gallery
		  @pictures = @gallery.pictures
	  end
  end


  # GET /requests/new
  def new
	  @request = Request.new
	  @gallery = @request.build_gallery
	  @pictures = @gallery.pictures
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
	  @request = Request.new request_params
	  @request.build_gallery
    @pictures = @request.gallery.pictures


    respond_to do |format|
      if @request.save

	      if params[:images]
		      # The magic is here ;)
		      params[:images].each { |image|
			      @pictures.create(image: image)
		      }
	      end

	      format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
	    params.require(:request).permit(:title, :description, gallery_attributes: [:id, :name, :description]).merge(user_id: current_user.id)
    end
end
