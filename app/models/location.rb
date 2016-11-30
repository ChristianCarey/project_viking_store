class Location < ApplicationRecord

  include ActionView::Helpers::TextHelper

  def self.most_frequent(num=3)
    # SELECT class.name, COUNT(*) AS state_count
    # FROM users JOIN addresses ON users.billing_id = class.id
    # GROUP BY class.id
    # ORDER BY state_count DESC
    # LIMIT num
    User.select("#{pluralize(name)}.name, COUNT(*)")
      .joins("JOIN addresses ON users.billing_id = #{name}.id")
      .group("#{name}.id")
      .order('count DESC')
      .limit(num.to_s)
  end
end
