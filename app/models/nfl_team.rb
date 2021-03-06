class NflTeam < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :nfl_players, -> { order('created_at ASC') }
end