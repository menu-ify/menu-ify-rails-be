require 'rails_helper'

RSpec.describe MenuItem, type: :model do 
  describe 'relationships' do 
    it { should belong_to :restaurant }
  end
end