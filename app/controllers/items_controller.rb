class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "建立成功"
      redirect_to items_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "更新成功"
      redirect_to items_path
    else
      render :edit
    end
  end

  private

    def find_item
      @item = Item.find_by_token(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :spec, :quantity, :unit, :token, :qr_code, :department_id, :employee_id)
    end
end