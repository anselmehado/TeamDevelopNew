
require 'rails_helper'

RSpec.describe Auction, :type => :model do
  validates :name, presence: true
  validates :content, presence: true
  validates :deadline, presence: true
  validates :status, presence: true

end
