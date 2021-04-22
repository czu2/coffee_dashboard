class CoffeeSalesController < ApplicationController
  before_action :set_coffee_sale, only: %i[ show edit update destroy ]

  # GET /coffee_sales or /coffee_sales.json
  def index
    @coffee_sales = CoffeeSale.all

    # Sales
    @sales_last_twelve_months = CoffeeSale.find_by_sql("
        SELECT 
          EXTRACT(month from date) as mes, sum(price) as ventas
        FROM
          coffee_sales
        WHERE 
          date BETWEEN '2020-04-01' and '#{Time.now}' 
        GROUP BY 
          mes
        ORDER BY 
          mes
      ")
    
    @sales_quantity_last_twelve_months = CoffeeSale.find_by_sql("
        SELECT 
          EXTRACT(month from date) as mes, count(date) as ventas
        FROM
          coffee_sales
        WHERE 
          date BETWEEN '2020-04-01' and '#{Time.now}'
        GROUP BY 
          mes
        ORDER BY 
          mes
      ")

    @sales_quantity_last_twelve_months = CoffeeSale.find_by_sql("
        SELECT 
          EXTRACT(month from date) as mes, avg(price) as ventas from coffee_sales
        WHERE 
          date BETWEEN '2020-04-01' and '#{Time.now}'
        GROUP BY 
          mes
        ORDER BY 
          mes
      ")

      
    # Origin
    @origin_last_month = CoffeeSale.last_month
    @origin_last_three_months = CoffeeSale.last_three_months
    @origin_last_six_months = CoffeeSale.last_six_months
    @origin_last_twelve_months = CoffeeSale.last_twelve_months

    # Blend
    @blend_last_month = CoffeeSale.last_month
    @blend_last_three_months = CoffeeSale.last_three_months
    @blend_last_six_months = CoffeeSale.last_six_months
    @blend_last_twelve_months = CoffeeSale.last_twelve_months

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
