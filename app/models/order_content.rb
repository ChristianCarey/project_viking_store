class OrderContent < ApplicationRecord
  def self.total_revenue(num_days=nil)
    # for each row, multiply quantity by product_id's product's price
    # sum of total cost for each row
    if num_days.nil?
      with_products.sum('quantity * products.price')
    else
      with_products.where("orders.checkout_date > '#{num_days.days.ago}'::date").sum('quantity * products.price')
    end
  end

  def self.with_products
    # returns table of OrderContent primary key and total cost
    select('*').joins('JOIN products ON product_id=products.id JOIN orders ON order_contents.order_id = orders.id')
  end
end
