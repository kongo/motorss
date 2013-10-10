class Proposal < ActiveRecord::Base
  def title
    "#{make} - #{model_name} (#{year_built}) - #{price}"
  end
end
