class Proposal < ActiveRecord::Base

  VEHICLE_TYPES = [
    :classic, :neoclassic, :chopper, :sport, :sporttourist, :tourist,
    :enduro, :cross, :pitbike, :supermoto, :trial, :scooter,
    :maxiscooter, :custom, :trike, :quadracycle, :watercraft, :snowmobile
  ]

  validates_inclusion_of   :vehicle_type, in: VEHICLE_TYPES
  validates_presence_of    :uin
  validates_uniqueness_of  :uin

  default_scope ->() { order 'uin desc' }

  def title
    "#{make} - #{model_name} (#{year_built}) - #{price}"
  end

  def full_link
    "http://" + Parsers::Motosale::ENDPOINT + "/" + link
  end
end
