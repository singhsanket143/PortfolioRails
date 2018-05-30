class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :update, :destroy, :edit]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index
    # @portfolio_items = Portfolio.angular
    # @portfolio_items = Portfolio.ruby_on_rails
    @portfolio_items = Portfolio.by_position
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times {@portfolio_item.technologies.build}
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html {redirect_to portfolios_path, notice: 'Your portfolio has been created'}
      else
        format.html {redirect_to :new}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html {redirect_to portfolios_path, notice: 'Your portfolio has been updated'}
      else
        format.html {redirect_to :edit}
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: 'Portfolio was destroyed'}
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
