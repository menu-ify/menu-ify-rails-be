require 'rails_helper'

RSpec.describe MenuItem, type: :model do 
  describe 'relationships' do 
    it { should belong_to :restaurant }
  end

  describe 'validations' do 
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :tags }
    it { should validate_presence_of :category }
    it { should validate_presence_of :image }
    it { should validate_presence_of :price }
  end

end