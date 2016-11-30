class OrderContent < ApplicationRecord
  def self.total_revenue
    # for each row, multiply quantity by product_id's product's price
    # sum of total cost for each row
    with_products.sum('quantity * products.price')
  end

  def self.with_products
    # returns table of OrderContent primary key and total cost
    select('*').joins('JOIN products ON product_id=products.id')
  end
end
