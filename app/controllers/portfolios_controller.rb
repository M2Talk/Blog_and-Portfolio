class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.all
    @page_title = "My Portfolio Items"
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
    @page_title = "My Portfolio Items"
  end

  def show
    @page_title = @portfolio_item.title
    @seo_keywords = @portfolio_item.body
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def edit
    @page_title = @portfolio_item.title
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
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolio_url(@portfolio_item), notice: "Portfolio item was succesfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Portfolio item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      :main_image, 
                                      :thumb_image,
                                      technologies_attributes: [:name]
                                     )
  end

end
