

module Location 

  def most_frequent(num=3)
    # SELECT class.name, COUNT(*) AS state_count
    # FROM users JOIN addresses ON users.billing_id = states.id
    # GROUP BY class.id
    # ORDER BY state_count DESC
    # LIMIT num
    plural_name = ActiveSupport::Inflector::pluralize(name)
    User.select("#{plural_name}.name, COUNT(*)")
      .joins("JOIN addresses ON users.billing_id = addresses.id")
      .joins("JOIN #{plural_name} ON addresses.#{name}_id = #{plural_name}.id")
      .group("#{plural_name}.id")
      .order('count DESC')
      .limit(num)
  end
end
