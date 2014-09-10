class HomeController < ApplicationController
  def index
  	 @categories = Category.all.map(&:name)
  end

  def show
	logger.info"ssssssssssssssssssssssssssssss#{params[:s].inspect}"
  	@categories = Category.find_by_name(params[:s]).ads	
  end
end
