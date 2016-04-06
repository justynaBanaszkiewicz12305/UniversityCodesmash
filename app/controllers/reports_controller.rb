class ReportsController < WebServiceController

  def total_sales
	
	sales = Sale.all
	total = 0
	sales.each { |sale| total = total + sale.total }

	
	render json:{number_of_sales: sales.length, total: total }
  end

  def sales_per_item

	sales = Sale.all
	

	render json: {
	  'burger'=> {}, 'chips' => {}, 'soft drink' => {}
	}
  end

end
