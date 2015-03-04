class ReportsController < ApplicationController
  def customers_and_products
  end

  def customers_and_categories
  end

  def employee_sales_per_quarter
  end

  def most_popular_products_per_category
    respond_to do |format|
      format.html {}
      format.json {
        cats = []
        prods = []
        last_cat_name = nil
        Category.find_by_sql("SELECT c.category_name, p.product_name, SUM(od.quantity) AS size
            FROM categories AS c
             INNER JOIN products AS p ON c.id = p.category_id
             INNER JOIN order_details AS od ON p.id = od.product_id
            GROUP BY c.category_name, p.product_name
            ORDER BY c.category_name").each do |i|
          if i.category_name != last_cat_name
            cats << {name: last_cat_name, children: prods} if last_cat_name != nil
            prods = []
            last_cat_name = i.category_name
          end
          prods << {name: i.product_name, size: i.size}
        end
        cats << {name: last_cat_name, children: prods}
        render json: {name:"", children: cats}
      }
    end
  end

def employee_sales_per_month
      @sales = Employee.find_by_sql("SELECT first_name, EXTRACT(MONTH FROM order_date) AS month, SUM(quantity * order_details.unit_price) AS total_sales
 FROM orders
  INNER JOIN employees ON orders.employee_id = employees.id
  INNER JOIN customers ON orders.customer_id = customers.id
  INNER JOIN order_details ON orders.id = order_details.order_id
  INNER JOIN products ON order_details.product_id = products.id
  INNER JOIN categories ON products.category_id = categories.id
 GROUP BY first_name, EXTRACT(MONTH FROM order_date)
 ORDER BY 1, 2;")
#      raise @sales.inspect
  end
end
