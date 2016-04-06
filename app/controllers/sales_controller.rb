class SalesController < WebServiceController

  def index # Show all the Sales
    render json: Sale.all
  end

  def show # Show a single Sale by 'id'
    id = params[:id]
    sale = Sale.find id
    render json: sale
  end

  def create
    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       sale.errors array in the debugger
    sale = Sale.new sale_params
	items = params[:sale][:items]
	total = 0
	items.each do |item|
		total = total + item[:price].to_f

		discount = item[:discount]
		if discount != nil
			total = total - discount[:amount].to_f
		end
	end

	sale.total = total
    sale.save
    render json: sale
  end

  private

  def sale_params
    params.require(:sale).permit!
  end

end
