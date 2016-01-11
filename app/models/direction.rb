class Direction < ActiveRecord::Base
  def sorted_resorts
    resorts = Resort.all
    @resorts ||= Resort.sort_by_distance(resorts)
  end
end
