require 'rails_helper'

RSpec.describe Restaurant, type: :model do 
  describe 'relationships' do 
    it { should have_many :menu_items }
  end

  describe 'validations' do 
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :logo }

  end
end