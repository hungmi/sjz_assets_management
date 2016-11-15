class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_parameters)
    if @property.save
      flash[:success] = "建立成功"
      redirect_to properties_path
    else
      render :new
    end
  end

  private

  def property_parameters
    params.require(:property).permit(:name)
  end
end