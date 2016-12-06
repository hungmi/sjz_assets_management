class PropertiesController < ApplicationController
  before_action :find_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "建立成功"
      redirect_to properties_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @property.update(property_params)
      flash[:success] = "更新成功"
      redirect_to properties_path
    else
      render :edit
    end
  end

  private

    def find_property
      @property = Property.find_by_token(params[:id])
    end

    def property_params
      params.require(:property).permit(:name)
    end
end