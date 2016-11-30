class OrderContent < ApplicationRecord
  def self.total_revenue
    # for each row, multiply quantity by product_id's product's price
    # sum of total cost for each row
    total_costs.sum
  end

  def self.total_costs
    # returns table of OrderContent primary key and total cost
    select('order_id, product_id, quantity * products.price AS total_cost').joins('JOIN products ON product_id=products.id').to_sql
  end
end
