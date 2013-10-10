class Proposal < ActiveRecord::Base
  default_scope ->() { order 'id desc' }

  def title
    "#{make} - #{model_name} (#{year_built}) - #{price}"
  end

  def full_link
    "http://" + Parsers::Motosale::ENDPOINT + "/" + link
  end
end
