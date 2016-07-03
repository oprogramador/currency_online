require 'open-uri'

class Exchange < ActiveRecord::Base
  has_many :currencies
end
