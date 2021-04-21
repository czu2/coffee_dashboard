class CoffeeSalesController < ApplicationController
  before_action :set_coffee_sale, only: %i[ show edit update destroy ]

  # GET /coffee_sales or /coffee_sales.json
  def index
    @coffee_sales = CoffeeSale.all
  end

  # GET /coffee_sales/1 or /coffee_sales/1.json
  def show
  end

  # GET /coffee_sales/new
  def new
    @coffee_sale = CoffeeSale.new
  end

  # GET /coffee_sales/1/edit
  def edit
  end

  # POST /coffee_sales or /coffee_sales.json
  def create
    @coffee_sale = CoffeeSale.new(coffee_sale_params)

    respond_to do |format|
      if @coffee_sale.save
        format.html { redirect_to @coffee_sale, notice: "Coffee sale was successfully created." }
        format.json { render :show, status: :created, location: @coffee_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffee_sales/1 or /coffee_sales/1.json
  def update
    respond_to do |format|
      if @coffee_sale.update(coffee_sale_params)
        format.html { redirect_to @coffee_sale, notice: "Coffee sale was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffee_sales/1 or /coffee_sales/1.json
  def destroy
    @coffee_sale.destroy
    respond_to do |format|
      format.html { redirect_to coffee_sales_url, notice: "Coffee sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_sale
      @coffee_sale = CoffeeSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coffee_sale_params
      params.require(:coffee_sale).permit(:origin, :blend, :price, :date)
    end
end
