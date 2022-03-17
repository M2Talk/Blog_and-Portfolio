class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_url(@portfolio_item),
        notice: "Portfolio item was succesfully created." }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolio_url(@portfolio_item), notice: "Portfolio item was succesfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  private
  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
  end

end
