class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  def self.count_with_days(num_days=nil, starting_point='created_at')
    return count unless num_days
    select('COUNT(*)').where("#{starting_point} > '#{num_days.days.ago}'::date")[0].count
  end

end
