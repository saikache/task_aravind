class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
    @categories = Category.pluck(:name)
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
       @ad = Ad.find(params[:id]).images.all

  end

  # GET /ads/new
  def new
    @ad = Ad.new
    @post_attachment = @ad.images.build
    @category = Category.all
  end

  # GET /ads/1/edit
  def edit
    @category = Category.all
  end

respond_to do |format|
     if @post.save
       params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @post.post_attachments.create!(:avatar => a, :post_id => @post.id)
       end
       format.html { redirect_to @post, notice: 'Post was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end


  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.category_id = params[:catagory_id]

    respond_to do |format|
      if @ad.save
# WORKING.....
        params[:images]['avatar'].each do |a|
          @post_attachment = @ad.images.create!(:avatar => a, :ad_id => @ad.id)
        end

        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)

        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end
           # @ad = Ad.find(params[:id]).images.all


    # Never trust parameters from the scary internet, only allow the white list through.
 def ad_params
      params.require(:ad).permit(:title, images: [:id, :ad_id, :avatar])
   end
end
 # def ad_params
 #      params.require(:post).permit(:title, post_attachments_attributes: [:id, :ad_id, :avatar])
 #   end